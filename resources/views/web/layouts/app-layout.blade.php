<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SERDI</title>
    @vite(['resources/css/app.css','resources/css/tailgrids-fallback.css','resources/js/app.js','resources/js/flowbite.js'])
</head>
<body class="bg-green-50">
    @include('web.layouts.infos')
    @include('web.layouts.navbar')
    <div>
      {{ $slot }}
    </div>
    {{-- @include('web.layouts.footer') --}}
</body>
</html>