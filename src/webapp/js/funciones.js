<!-- Script que expande elementos de lista -->
      function expandir() {
        for(x = 0; x < 50; x++) {
          window.moveTo(screen.ancho * -(x - 50) / 100, screen.alto * -(x - 50) / 100);
          window.resizeTo(screen.ancho * x / 50, screen.alto * x / 50);
    }
          window.moveTo(0,0);
          window.resizeTo(screen.ancho, screen.alto);
}

    function cambiarColor(x)
    {
      if(x.style.background=="lightsteelblue") {
          x.style.background="#fff";
      } else{
          x.style.background="lightsteelblue";
      }
      return false;
      }
      
      function mostrarMensaje1(){
      alert('Bienvenido al curso JavaScript de aprenderaprogramar.com');
      }   