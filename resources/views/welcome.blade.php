<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>{{ config('app.name') }}</title>

        <!-- Fonts -->
        @vite(['resources/css/app.css','resources/css/style.css','resources/js/bundle.js','resources/js/utilities.js','resources/js/app.js'])
    </head>
    <body class="antialiased">
        
    </body>
</html>
