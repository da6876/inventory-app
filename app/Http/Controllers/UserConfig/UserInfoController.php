<?php

namespace App\Http\Controllers\UserConfig;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class UserInfoController extends Controller
{
    public function index()
    {
        return view('UserConfig.userinfo');
    }

    public function store(Request $request){
        try {

            if ($request['id']==""){

                $validator = Validator::make($request->all(), [
                    'i_name' => 'required',
                    'i_email' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    //return json_encode(array('statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()));
                     return response()->json(['statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()]);
                }

                User::create([
                    'uid' => Str::uuid(),
                    'name' =>$request->i_name,
                    'email' =>$request->i_email,
                    'password' =>Hash::make($request->password),
                    'status' =>$request->status,
                    'user_name' =>$this->generateCustomString(),
                    'longitude' =>$request->longitude ?: '0.0',
                    'latitude' =>$request->latitude?: '0.0',
                    'ip' =>$request->ip ?: '0.0',
                    'mac' =>$request->mac ?: '0.0',
                    'last_login' =>$request->last_login ?: '0.0',
                    'create_by' => auth()->user()->id,
                    'update_by' => '0.0',
                    'create_date' => $this->getCurrentDateTime(),
                    'update_date' => '0.0',
                    'token' => Str::random(60)
                ]);

                return response()->json([
                    "statusCode" => 200,
                    "statusMsg" => "Data Added Successfully"
                ]);
            }

            else{
                $id = $request['id'];
                $navItem = User::find($id);

                if (!$navItem) {
                    return response()->json([
                        'statusCode' => 404,
                        'statusMsg' => 'Item not found.',
                    ]);
                }

                $validator = Validator::make($request->all(), [
                    'i_name' => 'required',
                    'i_email' => 'required',
                    'status' => 'required',
                ]);

                if ($validator->fails()) {
                    return json_encode(array('statusCode' => 204,'statusMsg' => 'Validation Error.', 'errors' => $validator->errors()));
                }

                $navItem->update([
                    'name' =>$request->i_name,
                    'email' =>$request->i_email,
                    'email' =>$request->i_email,
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
            $permission = User::findOrFail($id);
            $permission->update([
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
            $singleDataShow = User::findOrFail($id);
            return $singleDataShow;
        } catch (\Exception $e) {

            return response()->json([
                "statusCode" => 400,
                "statusMsg" => $e->getMessage()
            ]);
        }
    }
    private function generateCustomString()
    {
        $letters = Str::upper(Str::random(4));
        $digits = rand(10, 99);

        return $letters . $digits;
    }

    public function getUserData(Request $request)
    {
        if ($request->ajax()) {
            $query = User::query()->where('status', '!=', 'Deleted');
            // Apply custom filters
            if ($request->has('name') && $request->input('name') != '') {
                $query->where('name', 'like', '%' . $request->input('name') . '%');
            }
            if ($request->has('email') && $request->input('email') != '') {
                $query->where('email', 'like', '%' . $request->input('email') . '%');
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
    public function loginPage()
    {
        return view('auth.login');
    }

    public function loginPost(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'password' => 'required',
            'username' => 'required|email'
        ], [
            'password.required' => 'Please enter your password.',
            'username.required' => 'Please enter your username.',
            'username.email' => 'The username must be a valid email address.',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'statusCode' => 204,
                'statusMsg' => 'Validation Error.',
                'errors' => $validator->errors()
            ]);
        }

        $credentials = [
            'email' => $request->input('username'),
            'password' => $request->input('password')
        ];

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $user->last_login = Carbon::now();
            $user->longitude = $request->input('longitude');
            $user->latitude = $request->input('latitude');
            $user->ip = $request->input('ip');
            $user->mac = $request->input('mac', $user->mac);
            $user->token = $request->input('_token');
            $user->update_date = $request->input('_token');
            $user->update_by = $user->id;
            $user->save();
            return response()->json([
                'statusCode' => 200,
                'route' => 'dashboard'
            ]);
        } else {
            return response()->json([
                'statusCode' => 202,
                'statusMsg' => 'Username or password is incorrect.'
            ]);
        }
    }

    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/login'); // Redirect to login page after logout
    }

}
