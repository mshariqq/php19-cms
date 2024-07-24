@extends('layouts.app')

@section('title', 'Categories')
@section('description', 'Showing all post categories on php19')
@section('keywords', 'php19, post categories')
{{-- @section('thumbnail', $page->thumbnail) --}}
@section('content')

<div class="container-fluid">
    <div class="row">
        @include('inc/left-sidebar')



        <div class="col-md-10 bg-dark-light text-white pt-4 pb-5">

                  
            <nav class="breadcrumb text-light text-white">
                <a class="breadcrumb-item text-grey" href="{{ route('homepage') }}"> Home</a>
                <a class="breadcrumb-item text-grey text-warning" href="{{ route('categories.all') }}">Categories</a>
            </nav>

            <hr>
           
                

                <h5>Showing all categories</h5>
      
                <br>

                @if (count($cats) > 0)
                <div class="row">
                    @foreach ($cats as  $item)
                        <a title="Click to see post of this category" href="{{route('categories.posts', $item->slug)}}" class="mb-3 col-md-3">
                            <div class="card bg-black">
                                <div class="card-body text-light">
                                    <h3 class="text-white">{{$item->posts->count()}}</h3>
                                    <p>{{$item->name}}</p>
                                </div>
                            </div>
                        </a>
                    @endforeach
                </div>
                 
                @else 
                    <p class="text-warning">No categories found</p>
                @endif

             
                
                
           
        </div>



        {{-- @include('inc/right-sidebar') --}}
    </div>
</div>
@endsection