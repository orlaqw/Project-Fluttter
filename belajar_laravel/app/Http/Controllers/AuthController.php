<?php

namespace App\Http\Controllers;

use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use Validator;
use App\Models\User;
use Hash;

class AuthController extends Controller
{

    function register(Request $request) {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|unique:users',
            "address" => 'required',
            "birthday" => 'required',
            'role' => 'required',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }
        $data = [
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => Hash::make($request->get('password')),
            'role' => $request->get('role'),
            'address' => $request->get("address"),
            'birthday' => $request->get("birthday"),
        ];
        try {
            $insert= User::create($data);
            return response()->json([
                'status' => true,
                'message' => 'Data berhasil ditambahkan',
            ]);
            
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e,
            ]);
        }
    }

    function getUser() { //GET USER
        try{ //Try catch berfungsi untuk menguji jalannya script jika berhasil akan ditampilkan status yang bernilai true, jika gagal akan ditampilkan yang bagian exception. Kemudian nilai kembalian menggunakan data json dengan kode response()->json();
            $user = User::get();
            return response()->json([
                'status'=>true,
                'message'=>'berhasil load data user',
                'data'=>$user,
            ]);
        } catch(Exception $e){
            return response()->json([
                'status'=>false,
                'message'=>'gagal load data user. ', $e,
            ]);
        }
    }

    function getDetailUser($id) { //GET DETAIL USER
        try{ //di detail ini kita sertai parameter id functionnya. Kemudian kita gunakan script User::where('id',$id)->first(); untuk mendapatkan 1 baris data saja dengan menggunakan first().
            $user = User::where('id',$id)->first();
            return response()->json([
                'status'=>true,
                'message'=>'berhasil load data detail user',
                'data'=>$user,
            ]);
        } catch(Exception $e){
            return response()->json([
                'status'=>false,
                'message'=>'gagal load data detail user. '. $e,
            ]);
        }
    }

    function update_user($id, Request $request) {  //UPDATE USER
        //parameter $id untuk menangkap data dari parameter URL, dan Request $request berfungsi untuk menangkap data dari yang sudah di inputkan.
        $validator = Validator::make($request->all(), [
            'name'=>'required',
            'email'=>['required', Rule::unique('users')->ignore($id)], //update email yang datanya unique maka fungsinya tetap uniq kecuali yang memiliki nilai id dia sendiri yang dapat berubah. Jika ada data email yang sama miliknya yang lain maka akan ditolak.

            "address"=>'required',
            "birthday"=>'required',
            'role'=>'required',
            'password'=>'required',
        ]);


        if($validator->fails()){
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }
        $data = [
            'name'=>$request->get('name'),
            'email'=>$request->get('email'),
            'password'=>Hash::make($request->get('password')),
            'role'=>$request->get('role'),
            "address"=>$request->get("address"),
            "birthday"=>$request->get("birthday"),
        ];
        try {
            $update = User::where('id',$id)->update($data); //update maka script yang kita gunakan adalah update() sehingga datanya akan terupdate berdasarkan kondisi yang dimasukkan.
            return Response()->json([
                "status"=>true,
                'message'=>'Data berhasil diupdate'
            ]);


        } catch (Exception $e) {
            return Response()->json([
                "status"=>false,
                'message'=>$e
            ]);
        }
    }

    function hapus_user($id) { //HAPUS USER //parameter $id agar menghapus datanya berdasarkan id nya.
        try{
            User::where('id',$id)->delete(); //proses hapusnya menggunakan script delete() disertai where agar menghapusnya berdasarkan id yang dihapus
            return Response()->json([
                "status"=>true,
                'message'=>'Data berhasil dihapus'
            ]);
        } catch(Exception $e){
            return Response()->json([
                "status"=>false,
                'message'=>'gagal hapus user. '.$e,
            ]);
        }
    }


}
