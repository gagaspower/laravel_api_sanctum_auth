<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use DB;

class AuthController extends Controller
{
    public function login(Request $request) {
        $validate = \Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required',
        ]);

        if ($validate->fails()) {
            $respon = [
                'status' => 'error',
                'msg' => 'Validator error',
                'errors' => $validate->errors(),
                'content' => null,
            ];
            return response()->json($respon, 200);
        } else {
            $credentials = request(['email', 'password']);
            if (!Auth::attempt($credentials)) {
                $respon = [
                    'status' => 'error',
                    'msg' => 'Unathorized',
                    'errors' => null,
                    'content' => null,
                ];
                return response()->json($respon, 401);
            }
    
    
    
        $user = User::where('email', $request->email)->first();
    
        if (!$user || !Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }
    
        $token = $user->createToken('auth-token')->plainTextToken;
    
        $response = [
            'user' => $user,
            'token' => $token,
        ];
    
        return response($response, 201);
        }
    }


    public function getCurrentUser(Request $request){
        $user = $request->user();
        return response()->json($user);
    }


    public function updateUser(Request $request)
    {
        if($request->password == ''){
            $updated = DB::table('users')->where('email',$request->email)->update([
                'name' => $request->name
            ]);
            if($updated){
                return response()->json('User updated success',200);
            }else{
                return response()->json('Update user failed',400);
            }
        }else{
            $updated = DB::table('users')->where('email',$request->email)->update([
                'name' => $request->name,
                'password' => Hash::make($request->password)
            ]);
            if($updated){
                return response()->json('User updated success',200);
            }else{
                return response()->json('Update user failed',400);
            }
        }

    }

    public function logout(Request $request) {
        $user = $request->user();
        $user->currentAccessToken()->delete();
        $respon = [
            'status' => 'success',
            'msg' => 'Logout successfully',
            'errors' => null,
            'content' => null,
        ];
        return response()->json($respon, 200);
    }

}