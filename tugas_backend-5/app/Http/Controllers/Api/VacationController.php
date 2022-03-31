<?php

namespace App\Http\Controllers\Api;

use App\Models\Vacation;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\VacationResource;
use App\Http\Resources\AllVacationsResource;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facedes\Validator;

class VacationController extends Controller
{
    //
    public function index()
    {
        $vacations = Vacation::get();

        return AllVacationsResource::collection($vacations);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'image' => 'required',
            'city' => 'required',
            'price' => 'required',
        ]);

        $vacation = Vacation::create([
            'name' => $request->name,
            'description' => $request->description,
            'image' => $request->image,
            'city' => $request->city,
            'price' => $request->price,
        ]);

        return new VacationResource(true, 'Data Vacation Berhasil Ditambahkan', $vacation);
    }

    public function show(Vacation $vacation)
    {
        return new VacationResource(true, 'Data Vacation Ditemukan!', $vacation);
    }

    public function update(Request $request, Vacation $vacation)
    {
        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'image' => 'required',
            'city' => 'required',
            'price' => 'required',
        ]);

        $vacation->update(
            $request->all()
        );

        return new VacationResource(true, 'Data Vacation Berhasil Dubah!', $vacation);
    }

    public function destroy(Vacation $vacation)
    {
        $vacation->delete();

        return new VacationResource(true, 'Data Vacation Berhasil Dhapus!', $vacation);
    }
}
