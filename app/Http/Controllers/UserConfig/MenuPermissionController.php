<?php

namespace App\Http\Controllers\UserConfig;

use App\Http\Controllers\Controller;
use App\Models\MenuPermission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class MenuPermissionController extends Controller
{
    public function index()
    {
        return view('UserConfig.menu_permission');
    }

    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'user_id' => 'required',
                'permissions' => 'required',
                'menu_id' => 'required'
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'statusCode' => 204,
                    'statusMsg' => 'Validation Error.',
                    'errors' => $validator->errors(),
                    'request' => $request->all()
                ]);
            }

            $user_id = $request->input('user_id');
            $permissions = $request->input('permissions');
            $menu_ids = json_decode($request->input('menu_id'), true);

            if ($request->filled('id')) {
                $id = $request->input('id');
                $rowData = MenuPermission::where('uid', $id)->first();

                if (!$rowData) {
                    return response()->json([
                        'statusCode' => 404,
                        'statusMsg' => 'Data not found.',
                    ]);
                }
                foreach ($menu_ids as $menu_id) {
                    $rowData = MenuPermission::where('user_id', $user_id)
                        ->where('menu_id', $menu_id)
                        ->first();

                    if ($rowData) {
                        $rowData->update([
                            'permissions' => $permissions,
                            'updated_by' => auth()->user()->id,
                            'updated_at' => now()
                        ]);
                    } else {
                        MenuPermission::create([
                            'uid' => Str::uuid(),
                            'menu_id' => $menu_id,
                            'user_id' => $user_id,
                            'permissions' => $permissions,
                            'created_by' => auth()->user()->id,
                            'updated_by' => null,
                            'created_at' => now(),
                            'updated_at' => null
                        ]);
                    }
                }

                return response()->json([
                    'statusCode' => 200,
                    'statusMsg' => 'Data Updated Successfully'
                ]);
            }

            else {
                // Create new entries for all selected menus
                foreach ($menu_ids as $menu_id) {
                    MenuPermission::create([
                        'uid' => Str::uuid(),
                        'menu_id' => $menu_id,
                        'user_id' => $user_id,
                        'permissions' => $permissions,
                    ]);
                }

                return response()->json([
                    'statusCode' => 200,
                    'statusMsg' => 'Data Added Successfully'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'statusCode' => 400,
                'statusMsg' => $e->getMessage(),
                'request' => $request->all()
            ]);
        }
    }

    public function destroy($id)
    {
        try {
            $rowData = MenuPermission::where('id', $id)->firstOrFail();
            $rowData->delete();

            return response()->json([
                'statusCode' => 200
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'statusCode' => 400,
                'statusMsg' => $e->getMessage()
            ]);
        }
    }


    public function getData(Request $request)
    {
        if ($request->ajax()) {
            $query = MenuPermission::query()
                ->join('users', 'menu_user.user_id', '=', 'users.id')
                ->join('menus', 'menu_user.menu_id', '=', 'menus.id')
                ->select(
                    'menu_user.id',
                    'menu_user.permissions',
                    'users.name as user_name',
                    'menus.title as menu_name'
                );

            // Apply custom filters

            if ($request->has('title') && $request->input('title') !== '') {
                $query->where('menus.title', 'LIKE', '%' . $request->input('title') . '%');
            }

            $totalData = $query->count();
            $filteredData = $query->skip($request->input('start'))
                ->take($request->input('length'))
                ->get();

            return response()->json([
                'draw' => intval($request->input('draw')),
                'recordsTotal' => $totalData,
                'recordsFiltered' => $totalData,
                'data' => $filteredData
            ]);
        }

        return response()->json(['error' => 'Invalid request'], 400);
    }

}
