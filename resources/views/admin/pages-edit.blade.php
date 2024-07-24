

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
                <a class="breadcrumb-item text-grey " href="{{ route('admin.pages') }}">Pages</a>
                <a class="breadcrumb-item text-grey text-warning" href="{{ route('admin.pages.edit', $page->id) }}">Edit</a>

            </nav>

            <hr>     

                <h5>Edit Page <b class="text-primary">{{$page->name}}</b> </h5>
                <br>
                
                <form class="row" method="POST" action="{{ route('admin.pages.update', $page->id) }}">
                    @csrf

                    <div class="col-md-8">
                        <div class="form-group mb-2">
                            <label for="name">Name</label>
                            <input id="name" type="text" class="form-control @error('name') is-invalid @enderror"
                                name="name" value="{{ $page->name}}" required autocomplete="name" autofocus>
                            @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
    
                        <div class="form-group mb-2">
                            <label for="slug">Slug</label>
                            <input id="slug" type="text" class="form-control @error('slug') is-invalid @enderror"
                                name="slug" value="{{$page->slug}}" required autocomplete="slug">
                            @error('slug')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
    
                        <div class="form-group mb-2">
                            <label for="description">Description</label>
                            <textarea id="description"
                                class="form-control @error('description') is-invalid @enderror" name="description"
                                rows="3" >{{ $page->meta_desc }}</textarea>
                            @error('description')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
    
                        <div class="form-group mb-2">
                            <label for="keywords">Keywords</label>
                            <input id="keywords" type="text"
                                class="form-control @error('keywords') is-invalid @enderror" name="keywords"
                                value="{{ $page->meta_kw }}" >
                            @error('keywords')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
                        <div class="form-group mb-2">
                            <label for="content">Content</label>
                            <textarea id="content" class="form-control @error('content') is-invalid @enderror"
                                name="content" rows="6" >{{ $page->content }}</textarea>
                            @error('content')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>
    
                    </div>

                    <div class="col-md-4">
                        <div class="form-group mb-2">
                            <label for="status">Status</label>
                            <select id="status" class="form-control @error('status') is-invalid @enderror"
                                name="status" >
                                <option value="{{$page->status}}" selected>{{$page->status}}</option>
                                <option value="draft" {{ old('status') == 'draft' ? 'selected' : '' }}>Draft</option>
                                <option value="published" {{ old('status') == 'published' ? 'selected' : '' }}>Published</option>
                            </select>
                            @error('status')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                            @enderror
                        </div>

                        <div class="form-group mb-2">
                            <label for="parent">Parent Page</label>
                            <select name="parent" class="form-select" id="">
                                <option value="0">N\A</option>
                                <option value="{{$page->parent}}" selected>{{$page->parent}}</option>
                                @foreach ($pages as $item)
                                    <option value="{{$item->id}}">{{$item->id}} - {{ $item->name }}</option>
                                @endforeach
                            </select>
                        </div>


                        <br>
                        <button type="submit" class="btn btn-primary ">Save  <i class="fa fa-save    "></i> </button>

                    </div>

                </form>
           
        </div>

        {{-- @include('inc/right-sidebar') --}}
    </div>
</div>
@endsection

@section('scripts')
<script>
    CKEDITOR.replace('content');
</script>
@endsection
