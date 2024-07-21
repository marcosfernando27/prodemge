@include('header')

@section('title')
    Gestão de Pessoas
@stop

@include('navbar')

    <div class="lg:container mx-auto p-10">
        <div id="app">
            <index-pessoa-component></index-pessoa-component>
        </div>
    </div>

@include('footer')
