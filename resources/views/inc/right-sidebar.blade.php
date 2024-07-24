<div class="col-md-3 bg-black shadow border-start  p-4">

    @if(isset($page->user))
    <div class="row justify-content-between align-items-between">

        <div class="col-12 text-center">
            <img width="auto" height="200px" class="rounded" src="https://php19.com/wp-content/uploads/2024/02/dp.png" alt="">
            <h5 class="text-light mt-3 font-weight-bold text-capitalize">{{$page->user->name}}</h5>
            <p class="text-grey">
                {!! $page->user->bio !!}
                
            </p>
            <div class="col-12">
                @if(isset($page->user->upwork))
                <a target="__blank" href="{{$page->user->upwork}}" title="click to open upwork profile" style="background-color: #108a00" class="btn btn-success mb-2"> <i class="fas fa-caret-right    "></i> Hire on Upwork </a>
                <br>
                @endif

                @if(isset($page->user->github))
                <a target="__blank" href="{{$page->user->github}}" title="click to open github profile" class="btn btn-light mb-2"><i class="fab fa-github" aria-hidden="true"></i> Github Profile </a>
                <br>
                @endif


                @if(isset($page->user->linkedin))
                <a target="__blank" href="{{$page->user->linkedin}}" title="click to open Linkedin" class="btn btn-primary mb-2"> <i class="fab fa-linkedin" aria-hidden="true"></i> Linkedin profile </a>
    
                <br>
                @endif

                @if(isset($page->user->email))
                <a href="mailto:{{$page->user->email}}" title="click to send email" class="btn btn-outline-warning mb-2"> <i class="fa fa-envelope" aria-hidden="true"></i> Write E-Mail </a>
                @endif

                @if(isset($page->user->facebook))
                <a target="__blank" href="{{$page->user->facebook}}" title="click to open facebook profile" class="btn btn-light mb-2"><i class=" text-primary fab fa-facebook" aria-hidden="true"></i> Facebook Profile </a>
                <br>
                @endif

                @if(isset($page->user->instagram))
                <a target="__blank" href="{{$page->user->instagram}}" title="click to open instagram profile" class="btn btn-light mb-2"><i class="text-danger fab fa-instagram" aria-hidden="true"></i> Instagram Profile </a>
                <br>
                @endif

                @if(isset($page->user->twitter))
                <a target="__blank" href="{{$page->user->twitter}}" title="click to open twitter profile" class="btn btn-light mb-2"><i class="text-info fab fa-twitter" aria-hidden="true"></i> Twitter Profile </a>
                <br>
                @endif

                @if(isset($page->user->youtube))
                <a target="__blank" href="{{$page->user->youtube}}" title="click to open youtube channel" class="btn btn-light mb-2"><i class=" text-danger fab fa-youtube" aria-hidden="true"></i> Youtube channel </a>
                <br>
                @endif

                @if(isset($page->user->discord))
                <a target="__blank" href="{{$page->user->discord}}" title="click to open discord" class="btn btn-light mb-2"><i class="fab fa-discord" aria-hidden="true"></i> Discord Profile </a>
                <br>
                @endif
            </div>
        </div>
    </div>
    @else 
    <p class="text-warning">Author not found <br> <i style="font-size: 2rem" class="fa fa-chain-broken" aria-hidden="true"></i>  </p>
    @endif



</div>
