<?php

namespace App\Http\Controllers;

use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use Validator;
use App\Models\Movie;
use Hash;

class MovieController extends Controller
{
    
    function createMovie(Request $request) {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'voteaverage' => 'required',
            "overview" => 'required',
            "posterpath" => 'required',
            'category_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }
        $data = [
            'title' => $request->get('title'),
            'voteaverage' => $request->get('voteaverage'),
            'overview' => $request->get('overview'),
            'posterpath' => $request->get('posterpath'),
            'category_id' => $request->get("category_id"),
        ];
        try {
            $insert= Movie::create($data);
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

    function getMovie() { //GET MOVIE
        try{ //Try catch berfungsi untuk menguji jalannya script jika berhasil akan ditampilkan status yang bernilai true, jika gagal akan ditampilkan yang bagian exception. Kemudian nilai kembalian menggunakan data json dengan kode response()->json();
            $movie = Movie::get();
            return response()->json([
                'status'=>true,
                'message'=>'berhasil load data movie',
                'data'=>$movie,
            ]);
        } catch(Exception $e){
            return response()->json([
                'status'=>false,
                'message'=>'gagal load data movie. ', $e,
            ]);
        }
    }

    function getDetailMovie($id) { //GET DETAIL MOVIE
        try{ //di detail ini kita sertai parameter id functionnya. Kemudian kita gunakan script User::where('id',$id)->first(); untuk mendapatkan 1 baris data saja dengan menggunakan first().
            $movie = Movie::where('id',$id)->first();
            return response()->json([
                'status'=>true,
                'message'=>'berhasil load data detail movie',
                'data'=>$movie,
            ]);
        } catch(Exception $e){
            return response()->json([
                'status'=>false,
                'message'=>'gagal load data detail movie. '. $e,
            ]);
        }
    }

    function update_movie($id, Request $request) {  //UPDATE USER
        //parameter $id untuk menangkap data dari parameter URL, dan Request $request berfungsi untuk menangkap data dari yang sudah di inputkan.
        $validator = Validator::make($request->all(), [
            'title'=>'required',
            'voteaverage'=>'required', //update email yang datanya unique maka fungsinya tetap uniq kecuali yang memiliki nilai id dia sendiri yang dapat berubah. Jika ada data email yang sama miliknya yang lain maka akan ditolak.
            "overview"=>'required',
            "posterpath"=>'required',
            'category_id'=>'required',
        ]);


        if($validator->fails()){
            return response()->json([
                'status' => false,
                'message' => $validator->errors(),
            ]);
        }
        $data = [
            'title'=>$request->get('title'),
            'voteaverage'=>$request->get('voteaverage'),
            'overview'=>$request->get('overview'),
            "posterpath"=>$request->get("posterpath"),
            "category_id"=>$request->get("category_id"),
        ];
        try {
            $update = Movie::where('id',$id)->update($data); //update maka script yang kita gunakan adalah update() sehingga datanya akan terupdate berdasarkan kondisi yang dimasukkan.
            return Response()->json([
                "status"=>true,
                'message'=>'Data movie berhasil diupdate'
            ]);


        } catch (Exception $e) {
            return Response()->json([
                "status"=>false,
                'message'=>$e
            ]);
        }
    }

    function hapus_movie($id) { //HAPUS MOVIE //parameter $id agar menghapus datanya berdasarkan id nya.
        try{
            Movie::where('id',$id)->delete(); //proses hapusnya menggunakan script delete() disertai where agar menghapusnya berdasarkan id yang dihapus
            return Response()->json([
                "status"=>true,
                'message'=>'Data movie berhasil dihapus'
            ]);
        } catch(Exception $e){
            return Response()->json([
                "status"=>false,
                'message'=>'gagal hapus movie'.$e,
            ]);
        }
    }

}
