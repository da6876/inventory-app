<?php

namespace App\Http\Controllers\UserConfig;

use App\Http\Controllers\Controller;
use App\Models\auth\Role;
use App\Models\UserConfig\UserType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class UserTypeController extends Controller
{
    public function __construct()
    {
        // Apply 'role:admin' middleware to all methods in this controller
        //$this->middleware('role:admin');

        // Alternatively, apply middleware to specific methods only
        // $this->middleware('role:admin')->only(['index', 'store']);

        // Or exclude certain methods from middleware
        // $this->middleware('role:admin')->except(['store']);
        //$this->middleware('permission:user_type_create')->only('create', 'store');
       // $this->middleware('permission:user_type_edit')->only('edit', 'update');
        //$this->middleware('permission:user_type_delete')->only('destroy');
        $this->middleware('permission:user_type_view')->only('index', 'getData');
        $this->middleware('permission:user_type_create')->only('store');
        $this->middleware('permission:user_type_edit')->only('store', 'show');
        $this->middleware('permission:user_type_delete')->only('destroy');
    }
    public function index()
    {
        return view('UserConfig.user_type');
    }
    public function store(Request $request){
        try {
            if ($request['id']==""){

                $validator = Validator::make($request->all(), [
                    'i_name' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return response()->json(['statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()]);
                }

                UserType::create([
                    'uid' => Str::uuid(),
                    'name' =>$request->i_name,
                    'status' =>$request->status,
                    'create_by' => auth()->user()->id,
                    'update_by' => '0',
                    'create_date' => $this->getCurrentDateTime(),
                    'update_date' => '0'
                ]);

                return response()->json([
                    "statusCode" => 200,
                    "statusMsg" => "Data Added Successfully"
                ]);
            }

            else{
                $id = $request['id'];
                $rowData = UserType::where('uid', $id)->first();

                if (!$rowData) {
                    return response()->json([
                        'statusCode' => 404,
                        'statusMsg' => 'Data not found.',
                    ]);
                }

                $validator = Validator::make($request->all(), [
                    'i_name' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return json_encode(array('statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()));
                }

                $rowData->update([
                    'name' =>$request->i_name,
                    'status' =>$request->status,
                    'update_by' => auth()->user()->id,
                    'update_date' => $this->getCurrentDateTime()
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
            $rowData = UserType::where('uid', $id)->firstOrFail();
            $rowData->update([
                'status' => "Deleted",
                'update_by' => auth()->user()->id,
                'update_date' => $this->getCurrentDateTime()
            ]);

            return  response()->json([
                "statusCode" => 200
            ]);
        } catch (\Exception $e) {

            return json_encode(array(
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ));;
        }
    }
    public function show($id)
    {
        try {
            $rowData = UserType::where('uid', $id)->firstOrFail();
            return $rowData;
        } catch (\Exception $e) {

            return response()->json([
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ]);
        }
    }
    public function getUserTypeList()
    {
        $users = Role::all()->get();
        return response()->json($users);
    }
    public function getData(Request $request)
    {
        if ($request->ajax()) {
            $query = UserType::query()->where('status', '!=', 'Deleted');
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
