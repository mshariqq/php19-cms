@extends('layouts.app')

@section('title', 'Tags')
@section('description', 'Showing all tags on php19')
@section('keywords', 'php19 tags')
{{-- @section('thumbnail', $page->thumbnail) --}}
@section('content')

<div class="container-fluid">
    <div class="row">
        @include('inc/left-sidebar')

        <div class="col-md-10 bg-dark-light text-white pt-4 pb-5">

                  
            <nav class="breadcrumb text-light text-white">
                <a class="breadcrumb-item text-grey" href="{{ route('homepage') }}"> Home</a>
                <a class="breadcrumb-item text-grey text-warning" href="{{ route('tags.all') }}">Tags</a>
            </nav>

            <hr>
           
                

                <h5>Showing all tags</h5>
      
                <br>

                @if (count($tags) > 0)
                <div class="row">
                    @foreach ($tags as  $item)
                        <a title="Click to see post of this category" href="{{route('tags.posts', $item->slug)}}" class="mb-3 col-md-3">
                            <div class="card bg-black">
                                <div class="card-body text-light">
                                    <h3 class="text-white">{{$item->posts->count()}}</h3>
                                    <p>#{{$item->tag}}</p>
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