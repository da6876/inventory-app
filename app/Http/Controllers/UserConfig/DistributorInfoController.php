<?php

namespace App\Http\Controllers\UserConfig;

use App\Http\Controllers\Controller;
use App\Models\ProSetup\ProType;
use App\Models\UserConfig\DistributorInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class DistributorInfoController extends Controller
{
    public function index()
    {
        return view('UserConfig.distributor_info');
    }

    public function store(Request $request)
    {
        try {
            if ($request['id'] == "") {

                $validator = Validator::make($request->all(), [
                    'owner_name' => 'required',
                    'owner_phone' => 'required',
                    'owner_email' => 'required',
                    'company_name' => 'required',
                    'company_phone' => 'required',
                    'company_email' => 'required',
                    'address' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return response()->json(['statusCode' => 204, 'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()]);
                }

                DistributorInfo::create([
                    'uid' => Str::uuid(),
                    'owner_name' => $request->owner_name,
                    'owner_phone' => $request->owner_phone,
                    'owner_email' => $request->owner_email,
                    'company_name' => $request->company_name,
                    'company_phone' => $request->company_phone,
                    'company_email' => $request->company_email,
                    'address' => $request->address,
                    'status' => $request->status,
                    'create_by' => auth()->user()->id,
                    'update_by' => '0',
                    'create_date' => $this->getCurrentDateTime(),
                    'update_date' => '0'
                ]);

                return response()->json([
                    "statusCode" => 200,
                    "statusMsg" => "Data Added Successfully"
                ]);
            } else {
                $id = $request['id'];
                $rowData = DistributorInfo::where('uid', $id)->first();

                if (!$rowData) {
                    return response()->json([
                        'statusCode' => 404,
                        'statusMsg' => 'Data not found.',
                    ]);
                }

                $validator = Validator::make($request->all(), [
                    'owner_name' => 'required',
                    'owner_phone' => 'required',
                    'owner_email' => 'required',
                    'company_name' => 'required',
                    'company_phone' => 'required',
                    'company_email' => 'required',
                    'address' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return json_encode(array('statusCode' => 204, 'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()));
                }

                $rowData->update([
                    'owner_name' => $request->owner_name,
                    'owner_phone' => $request->owner_phone,
                    'owner_email' => $request->owner_email,
                    'company_name' => $request->company_name,
                    'company_phone' => $request->company_phone,
                    'company_email' => $request->company_email,
                    'address' => $request->address,
                    'status' => $request->status,
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

    public function destroy($id)
    {
        try {
            $rowData = DistributorInfo::where('uid', $id)->firstOrFail();
            $rowData->update([
                'status' => "Deleted",
                'update_by' => auth()->user()->id,
                'update_date' => $this->getCurrentDateTime()
            ]);

            return response()->json([
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
            $rowData = DistributorInfo::where('uid', $id)->firstOrFail();
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
            $query = DistributorInfo::query()->where('status', '!=', 'Deleted');
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
