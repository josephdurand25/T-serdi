@if(Session::get('echec'))
    <div class="flex">
        <x-Admin.alert type="echec">
            {{ Session::get('echec') }}
        </x-Admin.alert>     
        <script>
            window.onload = function() {
                var element = document.getElementById('message');
                setTimeout(() => {
                    element.remove();
                }, 4000);
            }
        </script>
    </div>   
@endif
@if(Session::get('success'))
    <div class="flex">
        <x-Admin.alert type="success">
            {{ Session::get('success') }}
        </x-Admin.alert>
        <script>
            window.onload = function() {
                var element = document.getElementById('message');
                setTimeout(() => {
                    element.remove();
                }, 4000);
            }
        </script>
    </div>
@endif