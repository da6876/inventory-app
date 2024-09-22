<?php

namespace App\Http\Controllers\ProSetup;

use App\Http\Controllers\Controller;
use App\Models\ProSetup\ProType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ProTypeController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:pro_type_view')->only('index', 'getData');
        $this->middleware('permission:pro_type_create')->only('store');
        $this->middleware('permission:pro_type_edit')->only('store', 'show');
        $this->middleware('permission:pro_type_delete')->only('destroy');
    }
    public function index()
    {
        return view('ProConfig.pro_type');
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

                ProType::create([
                    'uid' => (string) Str::uuid(),
                    'name' => $request->i_name,
                    'status' => $request->status,
                    'create_by' => auth()->user()->id,
                    'create_date' => $this->getCurrentDateTime(),
                    'update_by' => null,
                    'update_date' => null
                ]);

                return response()->json([
                    "statusCode" => 200,
                    "statusMsg" => "Data Added Successfully"
                ]);
            }

            else{
                $id = $request['id'];
                $rowData = ProType::where('uid', $id)->first();

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
            $rowData = ProType::where('uid', $id)->firstOrFail();
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
            $rowData = ProType::where('uid', $id)->firstOrFail();
            return $rowData;
        } catch (\Exception $e) {

            return response()->json([
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ]);
        }
    }
    public function getData(Request $request)
    {
        if ($request->ajax()) {
            $query = ProType::query()->where('status', '!=', 'Deleted');
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
