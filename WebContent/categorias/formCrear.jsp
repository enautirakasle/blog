<br>
<div class="jumbotron">
  <div class="container">
    <h1 class="display-4">Kategoria sortu</h1>
    <p class="lead">Kategoria berriak sortzeko leihoa.</p>
  </div>
</div>
<form method="post" action="guardarcategoria">
  <div class="form-group">
    <label for="categoria">Kategoria</label>
    <input type="text" class="form-control" id="categoria" aria-describedby="nombreHelp" placeholder="Sartu Kategoria">
    <small id="nombreHelp" class="form-text text-muted">Kategoria sartu behar da</small>
  </div>
   <div class="form-group">
    <label for="descripcion">Deskribapena</label>
    <input type="text" class="form-control" id=""descripcion"" aria-describedby="descripcionHelp" placeholder="Sartu deskribapena">
    <small id="descripcionHelp" class="form-text text-muted">Deskribapen lagungarri bat behar bada...</small>
  </div>
  <input type="submit" class="btn btn-primary" value="Gorde" name="gorde"/>
  </form>