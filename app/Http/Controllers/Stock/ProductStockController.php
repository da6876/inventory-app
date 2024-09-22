<?php

namespace App\Http\Controllers\Stock;

use App\Http\Controllers\Controller;
use App\Models\ProSetup\ProInfo;
use App\Models\Stock\ProductStock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProductStockController extends Controller
{
    public function index()
    {
        return view('stock.pro_stock_view');
    }
    public function create()
    {
        return view('stock.product_stock');
    }

    public function store(Request $request)
    {
        try {
            // Define validation rules
            $validator = Validator::make($request->all(), [
                'product_id.*' => 'required|exists:pro_info,id',
                'batch_number.*' => 'required|string',
                'production_date.*' => 'required|date',
                'expiry_date.*' => 'required|date|after:production_date.*',
                'quantity_in_stock.*' => 'required|integer|min:0',
                'mrp.*' => 'required|numeric|min:0',
                'dealer_price.*' => 'required|numeric|min:0',
                'status.*' => 'required|in:available,out_of_stock',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'statusCode' => 422,
                    'statusMsg' => 'Validation failed',
                    'errors' => $validator->errors()
                ]);
            }

            // Process the data
            $data = $request->all();
            foreach ($data['product_id'] as $index => $productId) {
                ProductStock::create([
                    'pro_id' => $productId,
                    'batch_number' => $data['batch_number'][$index],
                    'production_date' => $data['production_date'][$index],
                    'expiry_date' => $data['expiry_date'][$index],
                    'quantity_in_stock' => $data['quantity_in_stock'][$index],
                    'mrp' => $data['mrp'][$index],
                    'dealer_price' => $data['dealer_price'][$index],
                    'status' => $data['status'][$index],
                    'create_by' => auth()->user()->id,
                    'create_date' => now(),
                    'update_by' => null,
                    'update_date' => null
                ]);
            }

            return response()->json([
                'statusCode' => 200,
                'statusMsg' => 'Stock data added successfully!'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'statusCode' => 400,
                'statusMsg' => $e->getMessage()
            ]);
        }
    }

    public function destroy($id)
    {
        try {
            $rowData = ProductStock::findOrFail($id);
            $rowData->update([
                'status' => 'Deleted',
                'update_by' => auth()->user()->id,
                'update_date' => now()
            ]);

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

    public function show($id)
    {
        try {
            $rowData = ProductStock::findOrFail($id);
            return response()->json($rowData);
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
            $query = ProductStock::query()
                ->where('status', '!=', 'Deleted')
                ->with('proInfo'); // Eager load the ProInfo relationship

            // Apply custom filters
            if ($request->has('batch_number') && $request->input('batch_number') != '') {
                $query->where('batch_number', 'like', '%' . $request->input('batch_number') . '%');
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

    public function getProducts()
    {
        $products = ProInfo::where('status', '!=', 'Deleted')->get();
        return response()->json(['products' => $products]);
    }

}
