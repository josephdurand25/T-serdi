<div class="bg-{{ ($type=='success') ? 'green' : 'red' }}-100 p-5 w-full m-1 rounded" id="success-message">
    <div class="flex justify-between">
    <div class="flex space-x-3">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" class="flex-none fill-current text-{{ ($type=='success') ? 'green' : 'red' }}-500 h-4 w-4">
        <path d="{{ ($type=='success') ? 'M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm-1.25 16.518l-4.5-4.319 1.396-1.435 3.078 2.937 6.105-6.218 1.421 1.409-7.5 7.626z' : 'M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm4.597 17.954l-4.591-4.55-4.555 4.596-1.405-1.405 4.547-4.592-4.593-4.552 1.405-1.405 4.588 4.543 4.545-4.589 1.416 1.403-4.546 4.587 4.592 4.548-1.403 1.416z' }}" /></svg>
        <div class="flex-1 leading-tight text-sm text-green-700 font-medium">
          {{ $prefix }} {{ $slot }}
        </div>
    </div>
    <i class="fa-solid fa-close flex-none fill-current h-3 w-3  text-{{ ($type=='success') ? 'green' : 'red' }}-600"></i>
    </div>
</div>
