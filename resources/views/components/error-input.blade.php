@props(['input'])
@error($input)
    <p {{ $attributes->merge(['class' => 'text-xs italic text-red-500 my-2']) }} >
        {{ $message }}
    </p>
@enderror