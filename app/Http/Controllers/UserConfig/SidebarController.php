<?php

namespace App\Http\Controllers\UserConfig;

use App\Http\Controllers\Controller;
use App\Models\auth\Permission;
use App\Models\Menu\Menu;
use App\Models\ProSetup\ProType;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class SidebarController extends Controller
{
    public function index()
    {
        return view('UserConfig.side_bar');
    }
    public function store(Request $request){
        try {
            if ($request['id']==""){

                $validator = Validator::make($request->all(), [
                    'name' => 'required',
                    'url' => 'required',
                    'icon' => 'required',
                    'order' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return response()->json(['statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()]);
                }


                $newMenu = Menu::create([
                    'uid' => Str::uuid(),
                    'title' => $request->name,
                    'url' => $request->url,
                    'icon' => $request->icon,
                    'parent_id' => $request->parent_id,
                    'order' => $request->order,
                    'status' => $request->status,
                    'create_by' => auth()->user()->id,
                    'create_date' => $this->getCurrentDateTime(),
                ]);

                $newMenuId = $newMenu->id;

                $i_name = strtolower($request->name);
                $i_name = preg_replace('/[^a-z0-9]+/', '_', $i_name);

                Permission::insert([
                    ['name' => 'view', 'menu_id' => $newMenuId],
                    ['name' => 'create', 'menu_id' => $newMenuId],
                    ['name' => 'edit', 'menu_id' => $newMenuId],
                    ['name' => 'delete', 'menu_id' => $newMenuId],
                ]);

                return response()->json([
                    "statusCode" => 200,
                    "statusMsg" => "Data Added Successfully"
                ]);
            }

            else{
                $id = $request['id'];
                $rowData = Menu::where('uid', $id)->first();

                if (!$rowData) {
                    return response()->json([
                        'statusCode' => 404,
                        'statusMsg' => 'Data not found.',
                    ]);
                }

                $validator = Validator::make($request->all(), [
                    'name' => 'required',
                    'url' => 'required',
                    'icon' => 'required',
                    'order' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return json_encode(array('statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()));
                }

                $rowData->update([
                    'title' =>$request->name,
                    'url' =>$request->url,
                    'icon' =>$request->icon,
                    'parent_id' =>$request->parent_id,
                    'order' =>$request->order,
                    'status' =>$request->status,
                    'update_by' => auth()->user()->id,
                    'update_date' => $this->getCurrentDateTime()
                ]);
                $i_name = strtolower($request->name);
                $i_name = preg_replace('/[^a-z0-9]+/', '_', $i_name);

                Permission::where('menu_id', $rowData->id)->delete();

                Permission::insert([
                    ['name' =>  'view', 'menu_id' => $rowData->id],
                    ['name' =>  'create', 'menu_id' => $rowData->id],
                    ['name' =>  'edit', 'menu_id' => $rowData->id],
                    ['name' =>  'delete', 'menu_id' => $rowData->id],
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
    public function destroy($id){
        try {
            $rowData = Menu::where('uid', $id)->firstOrFail();

            // Update the status and other fields
            $updated = $rowData->update([
                'status' => "Deleted",
                'update_by' => auth()->user()->id,
                'update_date' => $this->getCurrentDateTime()
            ]);

            // Check if the update was successful
            if ($updated) {
                return response()->json([
                    "statusCode" => 200,
                    "data" => $rowData
                ]);
            } else {
                return response()->json([
                    "statusCode" => 400,
                    "statusMsg" => "Update failed."
                ]);
            }
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
            $rowData = Menu::where('uid', $id)->firstOrFail();
            return $rowData;
        } catch (\Exception $e) {

            return response()->json([
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ]);
        }
    }

    public function getMenuList($roleId): JsonResponse
    {
        // Fetch menus and their permissions for the given role
        $menus = Menu::leftJoin('role_menu_permissions', function ($join) use ($roleId) {
            $join->on('menus.id', '=', 'role_menu_permissions.menu_id')
                ->where('role_menu_permissions.role_id', '=', $roleId);
        })
            ->select(
                'menus.id',
                'menus.title',
                'role_menu_permissions.view',
                'role_menu_permissions.add',
                'role_menu_permissions.update',
                'role_menu_permissions.delete'
            )
            ->get();

        // Return the results as JSON
        return response()->json($menus);
    }
    public function getData(Request $request)
    {
        if ($request->ajax()) {
            $query = Menu::query()->where('status', '!=', 'Deleted');
            // Apply custom filters
            if ($request->has('title') && $request->input('title') != '') {
                $query->where('title', 'like', '%' . $request->input('title') . '%');
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
    public function getPrentMenu()
    {
        try {
            $rowData = Menu::where('url', '#')->get();
            return $rowData;
        } catch (\Exception $e) {

            return response()->json([
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ]);
        }
    }

    public function getMenusByRole(Request $request)
    {
        $roleId = $request->input('role_id', '1'); // Default to '1' if not provided

        // Get top-level menus with 'view' permission
        $menus = Menu::whereNull('parent_id')
            ->whereHas('permissions', function ($query) use ($roleId) {
                $query->where('role_id', $roleId)
                    ->where('name', 'view');  // Filter by the permission name
            })
            ->orderBy('order') // Order by the 'order' column
            ->with(['children' => function ($query) use ($roleId) {
                $query->whereHas('permissions', function ($query) use ($roleId) {
                    $query->where('role_id', $roleId)
                        ->where('name', 'view');  // Filter for child menus
                })
                    ->orderBy('order'); // Order child menus by the 'order' column
            }])
            ->get();
        return response()->json($menus);
    }
}
