<?php

namespace App\Http\Controllers\Menu;

use App\Http\Controllers\Controller;
use App\Models\Menu\RoleMenuPermission;
use Illuminate\Http\Request;

class MenuPermissionController extends Controller
{
    public function store(Request $request)
    {
        // Decode JSON string to array
        $permissions = json_decode($request->input('permissions', '[]'), true);

        // Validate and process the permissions data
        $validatedPermissions = array_map(function($permission) {
            return [
                'role_id' => $permission['role_id'],
                'menu_id' => $permission['menu_id'],
                'view' => isset($permission['view']) ? (bool) $permission['view'] : false,
                'add' => isset($permission['add']) ? (bool) $permission['add'] : false,
                'update' => isset($permission['update']) ? (bool) $permission['update'] : false,
                'delete' => isset($permission['delete']) ? (bool) $permission['delete'] : false,
            ];
        }, $permissions);

        // Insert or update permissions
        foreach ($validatedPermissions as $permission) {
            RoleMenuPermission::updateOrCreate(
                [
                    'role_id' => $permission['role_id'],
                    'menu_id' => $permission['menu_id']
                ],
                $permission
            );
        }

        return response()->json(['message' => 'Permissions updated successfully']);
    }
}
