<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>@yield('title')</title>
        <meta name="description" content="@yield('description')">
        <meta name="keywords" content="@yield('keywords')">
        <meta name="robots" content="index, follow">

        <meta property="og:title" content="@yield('title')">
        <meta property="og:description" content="@yield('description')">
        <meta property="og:image" content="@yield('thumbnail')">
        {{-- <meta property="og:url" content="http://example.com/page"> --}}

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css')}}">
        <link rel="stylesheet" href="{{ asset('assets/css/style.css')}}">
        {{-- <link rel="stylesheet" href="{{ asset('assets/ck/contents.css')}}"> --}}
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />        
        <script src="{{ asset('assets/js/jquery.min.js') }}"></script>
    </head>
    <body class="bg-light">

        <div class="container-fluid">
            @include('inc/navbar')

            @if (session('success'))
                <div class="alert alert-success" role="alert">
                    <strong>{{session('success')}}</strong>
                </div>
            @elseif(session('error'))
                <div class="alert alert-danger" role="alert">
                    <strong>{{session('error')}}</strong>
                </div>
            @endif
            @yield('content')


            <footer class="row">
                <div class="col-md-12">
                    <p class="text-center pt-4 pb-4">2024 - Full Website Coded by <a href="https://www.shariqq.com">Shariqq</a> in 24 hours</p>
                </div>
            </footer>
        </div>

        <script src="{{ asset('assets/js/bootstrap.bundle.js') }}"></script>
        <script src="{{ asset('assets/ck/ckeditor.js') }}"></script>
        @yield('scripts')
    </body>
</html>
