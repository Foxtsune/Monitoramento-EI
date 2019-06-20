<?php 
require_once $_SERVER['DOCUMENT_ROOT']."/Monitoramento-EI/assets/helpers.php";

require_once '../controller/CandidateController.php';
require_once 'template/header.php';
?>

<!-- Page Content -->
	<div class="container">
        <div id="page-content-wrapper">
            <section class="container-fluid text-center">
                <h1 class="mb-5">Editar Candidato</h1>
                 <?php print_r($candidate) ?>"
                <form action="../controller/CandidateController.php" method="post">
	                <div class="row my-md-2"> 
	                    <div class="col-md-8 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-name">Nome do Candidato</span>
							  </div>
							  <input type="text" required class="form-control" id="name" name="name" aria-describedby="basic-addon-name" value="<?php echo $candidate['name'] ?>">
							</div>                      
	                    </div>
	                    <div class="col-md-4 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-birth_date">Data de Nascimento</span>
							  </div>
							  <input type="date" required class="form-control" id="birth_date" name="birth_date" aria-describedby="basic-addon-birth_date" value="<?php echo $candidate['birth_date'] ?>">
							</div>
	                    </div>
					</div>

					<div class="row my-md-2"> 
	                    <div class="col-md-5 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-neighborhood">Bairro</span>
							  </div>
							  <input type="text" required class="form-control" id="neighborhood" name="neighborhood" aria-describedby="basic-addon-neighborhood" value="<?php echo $candidate['neighborhood'] ?>">
							</div>
	                    </div>
	                    <div class="col-md-5 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-street">Logradouro</span>
							  </div>
							  <input type="text" required class="form-control" id="street" name="street" aria-describedby="basic-addon-street"  value="<?php echo $candidate['name'] ?>">
							</div>                      
	                    </div>
	                    <div class="col-md-2 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-number">Número</span>
							  </div>
							  <input type="number" required class="form-control" id="number" name="number" aria-describedby="basic-addon-number" value="<?php echo $candidate['name'] ?>">
							</div>
	                    </div>
					</div>

					<div class="row my-md-2"> 
	                    <div class="col-md-6 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-father">Nome do Pai</span>
							  </div>
							  <input type="text" required class="form-control" id="father" name="father" aria-describedby="basic-addon-father" value="<?php echo $candidate['name'] ?>">
							</div>                      
	                    </div>
	                    <div class="col-md-6 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-mother">Nome da Mãe</span>
							  </div>
							  <input type="text" required class="form-control" id="mother" name="mother" aria-describedby="basic-addon-mother" value="<?php echo $candidate['name'] ?>">
							</div>
	                    </div>
					</div>

					<div class="row my-md-2"> 
	                    <div class="col-md-3 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-tel1">telefone</span>
							  </div>
							  <input type="tel" required class="form-control" id="tel1" name="tel1" aria-describedby="basic-addon-tel1" value="<?php echo $candidate['name'] ?>">
							</div>                      
	                    </div>
	                    <div class="col-md-3 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-tel2">telefone</span>
							  </div>
							  <input type="tel" required class="form-control" id="tel2" name="tel2" aria-describedby="basic-addon-tel2" value="<?php echo $candidate['name'] ?>">
							</div>                      
	                    </div>
	                    <div class="col-md-3 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-situation">Situação</span>
							  </div>
							  <select class="custom-select" id="situation" name="situation" aria-describedby="basic-addon-situation">
									<option value="aguardando">Aguardando</option><!--  0  -->
									<option value="confirmado">Confirmado</option><!--  1  -->
									<option value="desistente">Desistente</option><!-- -1  -->
						  		</select>
							</div>
	                    </div>
	                    <div class="col-md-3 col-sm-12">
	                    	<div class="input-group mb-md-3 mb-sm-1">
							  <div class="input-group-prepend">
							    <span class="input-group-text" id="basic-addon-situation">Unidade</span>
							  </div>
							  	<select class="custom-select" id="units_id" name="units_id" aria-describedby="basic-addon-units_id">
							  		<option></option>
						  			<?php foreach ($units as $unit): ?>
									<option <?php echo "value=".$unit['id'] ?>>
										<?php echo $unit['aname'] ?>
									</option>
						  			<?php endforeach ?>
						  		</select>
							</div>
	                    </div>
					</div>

					<input type="hidden" id="filename" name="filename" value="<?php echo basename(__FILE__) ?>">

					<div class="row my-md-2 justify-content-around mt-5">
	                    <div class="form-group col-md-6 col-sm-6">
	                       <label class="sr-only" for="insert">Inserir</label>
	                       <button type="submit" class="btn btn-outline-success btn-block" id="insert" name="insert">Inserir</button>
	                    </div>
	                    <div class="form-group col-md-6 col-sm-6">
	                       <label class="sr-only" for="cancel">Cancelar</label>
	                       <a href="index.php" class="btn btn-outline-secondary btn-block" id="cancel" name="cancel">Cancelar</a>
	                    </div>
	                </div>            
                </form>
            </section>
        </div>
    </div>
<!-- /#page-content-wrapper -->

 <!-- EMPTY DIV - PUSH FOOTER -->
    <div class="container p-5 m-2">
    </div>
<?php require_once 'template/footer.php'; ?>
<script type="text/javascript">applyMask()</script>
