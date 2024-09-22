<?php

namespace App\Http\Controllers\UserConfig;

use App\Http\Controllers\Controller;
use App\Models\auth\PermissionRole;
use App\Models\auth\Role;
use App\Models\Menu\Menu;
use App\Models\UserConfig\UserType;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class RoleController extends Controller
{
    public function index()
    {
        return view('UserConfig.roles');
    }
    public function indexs()
    {
        return view('UserConfig.permission');
    }

    public function store(Request $request)
    {
        try {
            if ($request['id'] == "") {

                $validator = Validator::make($request->all(), [
                    'i_name' => 'required',
                ]);

                if ($validator->fails()) {
                    return response()->json(['statusCode' => 204, 'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()]);
                }
                $i_name = strtolower($request->i_name);
                $i_name = preg_replace('/[^a-z0-9]+/', '_', $i_name);
                Role::create([
                    'name' => $i_name,
                    'description' => $request->i_name,
                ]);

                return response()->json([
                    "statusCode" => 200,
                    "statusMsg" => "Data Added Successfully"
                ]);
            }

            else {
                $id = $request['id'];
                $rowData = Role::where('id', $id)->first();

                if (!$rowData) {
                    return response()->json([
                        'statusCode' => 404,
                        'statusMsg' => 'Data not found.',
                    ]);
                }

                $validator = Validator::make($request->all(), [
                    'i_name' => 'required',
                ]);

                if ($validator->fails()) {
                    return json_encode(array('statusCode' => 204, 'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()));
                }

                $i_name = strtolower($request->i_name);
                $i_name = preg_replace('/[^a-z0-9]+/', '_', $i_name);

                $rowData->update([
                    'name' => $i_name,
                    'description' => $request->i_name,
                ]);

                return response()->json([
                    "statusCode" => 200,
                    "statusMsg" => "Data Updated Successfully"
                ]);
            }

        } catch (\Exception $e) {
            return response()->json([
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ]);
        }
    }

    public function destroy($id)
    {
        try {
            $rowData = Role::findOrFail($id); // Fetch the role or fail if not found
            $rowData->delete(); // Permanently delete the record

            return response()->json([
                "statusCode" => 200,
                "statusMsg" => "Role deleted successfully."
            ]);
        } catch (\Exception $e) {
            return response()->json([
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ]);
        }
    }

    public function show($id)
    {
        try {
            $rowData = Role::where('id', $id)->firstOrFail();
            return $rowData;
        } catch (\Exception $e) {

            return response()->json([
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ]);
        }
    }

    public function getRolesList()
    {
        $users = Role::all();
        return response()->json($users);
    }

    public function getMenuList($roleId): JsonResponse
    {

        $results = DB::table('menus as a')
            ->join('permissions as p', 'a.id', '=', 'p.menu_id')
            ->leftJoin('permission_role as pr', function($join) use ($roleId) {
                $join->on('p.id', '=', 'pr.permission_id')
                    ->where('pr.role_id', '=', $roleId);
            })
            ->select(
                'a.id as menu_id',
                'a.title',
                'p.name as permission_name',
                'p.id as permission_id',
                DB::raw('IF(pr.role_id IS NOT NULL, 1, 0) as has_permission')
            )
            ->where('a.status', 'A')
            ->get();

        return response()->json($results);
    }

    public function submitPermissions(Request $request)
    {
        // Validate incoming request
        $request->validate([
            'permissions' => 'required|json', // Ensure it's a JSON string
        ]);

        // Decode the JSON string to an array
        $permissions = json_decode($request->input('permissions'), true);

        // Loop through the permissions and save each one
        foreach ($permissions as $permission) {
            PermissionRole::updateOrCreate(
                [
                    'role_id' => $permission['role_id'],
                    'menu_id' => $permission['menu_id'],
                    'permission_id' => $permission['permission_id'],
                ]
            );
        }

        return response()->json(['message' => 'Permissions saved successfully.']);
    }

    public function getData(Request $request)
    {
        if ($request->ajax()) {
            $query = Role::query();
            // Apply custom filters
            if ($request->has('name') && $request->input('name') != '') {
                $query->where('name', 'like', '%' . $request->input('name') . '%');
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
