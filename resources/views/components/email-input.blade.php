@props(['disabled' => false])

<input type="email"  {{ $attributes->merge([
    'class' => 'w-full rounded-md shadow-sm border-[1.5px] border-stroke py-2 px-5 font-medium outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-gray-900 dark:focus:border-primary']) }} 
    />
