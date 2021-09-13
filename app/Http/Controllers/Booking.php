<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use DB;
use App\Models\User;
class Booking extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $user = $request->user();
        $list = DB::table('booking_servis')->where('user_id',$user->id)->get();
        return response()->json($list, 200);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $getUser = DB::table('users')->where('email',$request->email)->first();
        $insert = DB::table('booking_servis')->insert([
            'kode_booking' => $request->kode,
            'tgl_booking'  => $request->tanggal,
            'jenis_motor'  => $request->jenis,
            'plat_motor'   => $request->plat,
            'keluhan'      => $request->keluhan,
            'nama_booking' => $request->nama,
            'no_hp_booking'=> $request->noHp,
            'alamat_lengkap_booking' => $request->alamat,
            'status_booking'    => 'Baru',
            'user_id'       => $getUser->id
        ]);
        if($insert){
            return response()->json(['msg' => 'Booking Service berhasil dilakukan'], 200);
        }else{
            return response()->json(['msg' => 'Tidak bisa melakukan booking service'], 401);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $detail = DB::table('booking_servis')
                  ->where('booking_servis.id',$id)
                  ->get();

        return response()->json($detail[0],200);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function getNumber()
    {

            date_default_timezone_set('Asia/Jakarta');
            $q=DB::table('booking_servis')->select(DB::raw('MAX(RIGHT(kode_booking,6)) as kd_max'));
            if($q->count()>0)
            {
                foreach($q->get() as $k)
                {
                    $tmp = ((int)$k->kd_max)+1;
                    $kd = 'SRV/'.date('Ymd').'/'.sprintf("%06s", $tmp);
                }
            }
            else
            {
                    $kd = 'SRV/'.date('Ymd').'/'."000001";
            }
    
            return response()->json(['kode' => $kd],200);
    }
}
