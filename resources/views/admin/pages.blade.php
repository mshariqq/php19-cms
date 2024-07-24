@extends('layouts.app')

@section('title', 'Admin Pages')
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
                <a class="breadcrumb-item text-grey text-warning" href="{{ route('admin.pages') }}">Pages</a>
            </nav>

            <hr>     

                <h5>Showing all tags</h5>
                <a href="{{route('admin.pages.new')}}" class="btn btn-primary">New Page</a>
                <br>
                <br>

                @if (count($pages) > 0)
                
                    <table class="table">
                        <thead>
                            <tr>
                                <th>name</th>
                                <th>slug</th>
                                <th>views</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($pages as $item)
                                <tr>
                                    <td>
                                        <a href="{{ url('pages/' . $item->slug) }}">{{$item->name}}</a>
                                    </td>
                                    <td>{{$item->slug}}</td>
                                    <td>{{$item->views}}</td>
                                    <td>
                                        <a href="{{route('admin.pages.edit', $item->id)}}" class="btn btn-sm btn-primary">
                                        <i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        <a href="{{route('admin.pages.delete', $item->id)}}" class="btn btn-sm btn-danger">
                                            <i class="fa fa-trash" aria-hidden="true"></i></a>

                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            {{$pages->links('pagination::bootstrap-4')}}

                        </tfoot>
                    </table>
                 
                @else 
                    <p class="text-warning">No pages found</p>
                @endif

             
                
                
           
        </div>

        {{-- @include('inc/right-sidebar') --}}
    </div>
</div>
@endsection