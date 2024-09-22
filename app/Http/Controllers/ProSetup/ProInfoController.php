<?php

namespace App\Http\Controllers\ProSetup;

use App\Http\Controllers\Controller;
use App\Models\ProSetup\ProInfo;
use App\Models\ProSetup\ProSubCategory;
use App\Models\ProSetup\ProType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ProInfoController extends Controller
{
    public function index()
    {
        return view('ProConfig.pro_info');
    }
    public function store(Request $request){
        try {
            if ($request['id']==""){

                $validator = Validator::make($request->all(), [
                    'i_name' => 'required',
                    'pro_type_id' => 'required',
                    'cat_id' => 'required',
                    'sub_cat_id' => 'required',
                    'shot_decs' => 'required',
                    'unit' => 'required',
                    'pcs_per_ctn' => 'required',
                    'pro_image1' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return response()->json(['statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()]);
                }
                if ($request->hasFile('pro_image1')) {
                    $ran_one = uniqid();
                    $ext_one = strtolower($request->pro_image1->getClientOriginalExtension());
                    $one_full_name = $ran_one . '.' . $ext_one;
                    $upload_path_one = "assets/product_img/";
                    $image1fileUrl = $upload_path_one . $one_full_name;
                    $request->pro_image1->move($upload_path_one, $one_full_name);
                } else {
                    $image1fileUrl = "";
                }
                ProInfo::create([
                    'uid' => Str::uuid(),
                    'name' =>$request->i_name,
                    'pro_type_id' =>$request->pro_type_id,
                    'cat_id' =>$request->cat_id,
                    'sub_cat_id' =>$request->sub_cat_id,
                    'shot_decs' =>$request->shot_decs,
                    'decs' =>$request->decs? :'0',
                    'unit' =>$request->unit? :'0',
                    'pcs_per_ctn' =>$request->pcs_per_ctn? :'0',
                    'dp_unit' =>$request->dp_unit? :'0',
                    'rp_unit' =>$request->rp_unit? :'0',
                    'mrp_unit' =>$request->mrp_unit? :'0',
                    'pro_sku_code' =>'SKU-' . strtoupper(bin2hex(random_bytes(4))),
                    'pro_image1' =>$image1fileUrl? :'No Image',
                    'pro_image2' =>$request->pro_image2? :'No Image',
                    'status' =>$request->status,
                    'create_by' => auth()->user()->id,
                    'create_date' => $this->getCurrentDateTime(),
                ]);

                return response()->json([
                    "statusCode" => 200,
                    "statusMsg" => "Data Added Successfully"
                ]);
            }

            else{
                $id = $request['id'];
                $rowData = ProInfo::where('uid', $id)->first();

                if (!$rowData) {
                    return response()->json([
                        'statusCode' => 404,
                        'statusMsg' => 'Data not found.',
                    ]);
                }

                $validator = Validator::make($request->all(), [
                    'i_name' => 'required',
                    'pro_type_id' => 'required',
                    'cat_id' => 'required',
                    'sub_cat_id' => 'required',
                    'shot_decs' => 'required',
                    'unit' => 'required',
                    'pcs_per_ctn' => 'required',
                    'pro_image1' => 'required',
                    'cat_id' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return json_encode(array('statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()));
                }
                if ($request->hasFile('pro_image1')) {
                    $oldImage = $rowData->pro_image1;
                    if ($oldImage && file_exists(public_path($oldImage))) {
                        unlink(public_path($oldImage));
                    }
                    $ran_one = uniqid();
                    $ext_one = strtolower($request->pro_image1->getClientOriginalExtension());
                    $one_full_name = $ran_one . '.' . $ext_one;
                    $upload_path_one = "assets/product_img/";
                    $image1fileUrl = $upload_path_one . $one_full_name;
                    $request->pro_image1->move($upload_path_one, $one_full_name);
                } else {
                    $image1fileUrl = $rowData->pro_image1;
                }
                $rowData->update([
                    'name' =>$request->i_name,
                    'pro_type_id' =>$request->pro_type_id,
                    'cat_id' =>$request->cat_id,
                    'sub_cat_id' =>$request->sub_cat_id,
                    'shot_decs' =>$request->shot_decs,
                    'decs' =>$request->decs? :'0',
                    'unit' =>$request->unit? :'0',
                    'pcs_per_ctn' =>$request->pcs_per_ctn? :'0',
                    'dp_unit' =>$request->dp_unit? :'0',
                    'rp_unit' =>$request->rp_unit? :'0',
                    'mrp_unit' =>$request->mrp_unit? :'0',
                    'pro_image1' =>$image1fileUrl,
                    'pro_image2' =>$request->pro_image2? :'No Image',
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
            $rowData = ProInfo::where('uid', $id)->firstOrFail();
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
            $rowData = ProInfo::where('uid', $id)->firstOrFail();
            return $rowData;
        } catch (\Exception $e) {

            return response()->json([
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ]);
        }
    }
    public function GetProSubCatByCatId(Request $request)
    {
        $categoryId = $request->input('cat_id');

        if (!$categoryId) {
            return response()->json([]);
        }

        $subcategories = ProSubCategory::where('cat_id', $categoryId)
            ->where('status', '!=', 'Deleted')
            ->get();

        return response()->json($subcategories);
    }
    public function GetProType()
    {
        $categories = ProType::where('status', '!=', 'Deleted')->get();
        return response()->json($categories);
    }

    public function getData(Request $request)
    {
        if ($request->ajax()) {
            $query = ProInfo::query()->where('status', '!=', 'Deleted');
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
