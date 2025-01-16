<?php

namespace App\Http\Controllers;

use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use Validator;
use App\Models\Category;
use Hash;

class CategoryController extends Controller
{
    
    function createCategory(Request $request) {
        $validator = Validator::make($request->all(), [
            'category_name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }
        $data = [
            'category_name' => $request->get('category_name'),
        ];
        try {
            $insert= Category::create($data);
            return response()->json([
                'status' => true,
                'message' => 'Data category berhasil ditambahkan',
            ]);
            
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => $e,
            ]);
        }
    }

    function getCategory() { //GET CATEGORY
        try{ //Try catch berfungsi untuk menguji jalannya script jika berhasil akan ditampilkan status yang bernilai true, jika gagal akan ditampilkan yang bagian exception. Kemudian nilai kembalian menggunakan data json dengan kode response()->json();
            $category = Category::get();
            return response()->json([
                'status'=>true,
                'message'=>'berhasil load data category',
                'data'=>$category,
            ]);
        } catch(Exception $e){
            return response()->json([
                'status'=>false,
                'message'=>'gagal load data category. ', $e,
            ]);
        }
    }

    function getDetailCategory($id) { //GET DETAIL CATEGORY
        try{ //di detail ini kita sertai parameter id functionnya. Kemudian kita gunakan script User::where('id',$id)->first(); untuk mendapatkan 1 baris data saja dengan menggunakan first().
            $category = Category::where('id',$id)->first();
            return response()->json([
                'status'=>true,
                'message'=>'berhasil load data detail category',
                'data'=>$category,
            ]);
        } catch(Exception $e){
            return response()->json([
                'status'=>false,
                'message'=>'gagal load data detail category. '. $e,
            ]);
        }
    }

    function update_category($id, Request $request) {  //UPDATE CATEGORY
        //parameter $id untuk menangkap data dari parameter URL, dan Request $request berfungsi untuk menangkap data dari yang sudah di inputkan.
        $validator = Validator::make($request->all(), [
            'category_name'=>'required',
        ]);


        if($validator->fails()){
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }
        $data = [
            'category_name'=>$request->get('category_name'),
        ];
        try {
            $update = Category::where('id',$id)->update($data); //update maka script yang kita gunakan adalah update() sehingga datanya akan terupdate berdasarkan kondisi yang dimasukkan.
            return Response()->json([
                "status"=>true,
                'message'=>'Data category berhasil diupdate'
            ]);


        } catch (Exception $e) {
            return Response()->json([
                "status"=>false,
                'message'=>$e
            ]);
        }
    }

    function hapus_category($id) { //HAPUS CATEGORY //parameter $id agar menghapus datanya berdasarkan id nya.
        try{
            Category::where('id',$id)->delete(); //proses hapusnya menggunakan script delete() disertai where agar menghapusnya berdasarkan id yang dihapus
            return Response()->json([
                "status"=>true,
                'message'=>'Data category berhasil dihapus'
            ]);
        } catch(Exception $e){
            return Response()->json([
                "status"=>false,
                'message'=>'gagal hapus category. '.$e,
            ]);
        }
    }

}
