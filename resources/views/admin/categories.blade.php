@extends('layouts.app')

@section('title', 'Admin Categories')
{{-- @section('description', 'Showing all tags on php19')
@section('keywords', 'php19 tags') --}}
{{-- @section('thumbnail', $page->thumbnail) --}}
@section('content')

<div class="container-fluid">
    <div class="row">
        @include('inc/left-sidebar')

        <div class="col-md-10 bg-dark-light text-white pt-4 pb-5">

                  
            <nav class="breadcrumb text-light text-white">
                <a class="breadcrumb-item text-grey" href="{{ route('dashboard') }}"> Admin</a>
                <a class="breadcrumb-item text-grey text-warning" href="{{ route('admin.categories') }}">Categories</a>
            </nav>

            <hr>     

                <h5>Showing all categories</h5>
               
                <br>

                @if (count($cats) > 0)
                
                    <table class="table">
                        <thead>
                            <tr>
                                <th>name</th>
                                <th>slug</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($cats as $item)
                                <tr>
                                    <td>
                                        <a href="{{ route('categories.posts' , $item->slug) }}">{{$item->name}}</a>
                                    </td>
                                    <td>{{$item->slug}}</td>
                                    <td>
                                        {{-- <a href="{{route('admin.pages.edit', $item->id)}}" class="btn btn-sm btn-primary">
                                        <i class="fa fa-pencil" aria-hidden="true"></i></a> --}}
                                        <a href="{{route('admin.categories.delete', $item->id)}}" class="btn btn-sm btn-danger">
                                            <i class="fa fa-trash" aria-hidden="true"></i></a>

                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            {{$cats->links('pagination::bootstrap-4')}}

                        </tfoot>
                    </table>
                 
                @else 
                    <p class="text-warning">No pages found</p>
                @endif

                <hr>
                <form action="{{route('admin.categories.store')}}" method="post" class="col-md-4">
                    @csrf
                    <div class="form-group mb-2">
                      <label for="">Category</label>
                      <input type="text"
                        class="form-control" name="tag" id="" aria-describedby="helpId" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="">Slug</label>
                        <input type="text"
                          class="form-control" name="slug" id="" aria-describedby="helpId" placeholder="">
                      </div>
                        <br>
                    <button class="btn btn-success" type="submit">Save <i class="fa fa-save    "></i> </button>
                </form>

             
                
                
           
        </div>

        {{-- @include('inc/right-sidebar') --}}
    </div>
</div>
@endsection