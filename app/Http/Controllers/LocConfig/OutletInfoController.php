<?php

namespace App\Http\Controllers\LocConfig;

use App\Http\Controllers\Controller;
use App\Models\LocConfig\AreaInfo;
use App\Models\LocConfig\OutletInfo;
use App\Models\LocConfig\ThanaInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class OutletInfoController extends Controller
{
    public function index()
    {
        return view('LocConfig.outlet');
    }
    public function store(Request $request){
        try {
            if ($request['id']==""){

                $validator = Validator::make($request->all(), [
                    'i_name' => 'required',
                    'div_id' => 'required',
                    'dis_id' => 'required',
                    'tha_id' => 'required',
                    'ara_id' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return response()->json(['statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()]);
                }

                OutletInfo::create([
                    'uid' => Str::uuid(),
                    'name' =>$request->i_name,
                    'div_id' =>$request->div_id,
                    'dis_id' =>$request->dis_id,
                    'tha_id' =>$request->tha_id,
                    'ara_id' =>$request->ara_id,
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
                $rowData = OutletInfo::where('uid', $id)->first();

                if (!$rowData) {
                    return response()->json([
                        'statusCode' => 404,
                        'statusMsg' => 'Data not found.',
                    ]);
                }

                $validator = Validator::make($request->all(), [
                    'i_name' => 'required',
                    'div_id' => 'required',
                    'tha_id' => 'required',
                    'dis_id' => 'required',
                    'ara_id' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return json_encode(array('statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()));
                }

                $rowData->update([
                    'name' =>$request->i_name,
                    'div_id' =>$request->div_id,
                    'tha_id' =>$request->tha_id,
                    'dis_id' =>$request->dis_id,
                    'ara_id' =>$request->ara_id,
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
            $rowData = OutletInfo::where('uid', $id)->firstOrFail();
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
            $rowData = OutletInfo::where('uid', $id)->firstOrFail();
            return $rowData;
        } catch (\Exception $e) {

            return response()->json([
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ]);
        }
    }
    public function GetArea(Request $request)
    {
        $divId = $request->input('divId');
        $disId = $request->input('dis_id');
        $thaId = $request->input('thaId');
        if (!$thaId) {
            return response()->json([]);
        }
        $categories = AreaInfo::where('status', '!=', 'Deleted')->where('div_id', '=', $divId)->where('dis_id', '=', $disId)->where('tha_id', '=', $thaId)->get();
        return response()->json($categories);
    }
    public function getData(Request $request)
    {
        if ($request->ajax()) {
            $query = OutletInfo::query()->where('status', '!=', 'Deleted');
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
