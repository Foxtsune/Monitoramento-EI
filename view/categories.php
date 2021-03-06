<?php 
require_once '../assets/helpers.php';
require_once '../controller/CandidateController.php';
$controller->notAdmin();
require_once ($controller->importHeader($_SESSION['admin']));
?>
    <section class="container-fluid text-center">
        <h1 class="mb-5"><span id='toolTip' tabindex='0' data-toggle='tooltip' title='A idade é baseada na data atual (<?php echo date("d-m-Y") ?>)' style='cursor: help;'> Infantil - <?php echo isset($_GET['inf'])?$_GET['inf']:"" ?></span></h1>
        <form action="categories.php" method="get" class="was-validated">
            <div class="row my-md-3 my-sm-5 justify-content-around">
                <div class="col-md-3 col-sm-12">
                    <div class="input-group my-2">
                        <div class="input-group-prepend">
                            <span id='toolTip' tabindex='0' data-toggle='tooltip' title='A idade é baseada na data atual' style='cursor: help;'>
                            <span class="input-group-text" id="basic-addon-I">Infantil</span>
                        </div>
                        <select class="custom-select" required id="inf" name="inf" aria-describedby="basic-addon-inf">
                            <option value='I' selected>1</option>
                            <option value='II'>2</option>
                            <option value='III'>3</option>
                            <option value='IV'>4</option>
                            <option value='V'>5</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12">
                    <div class="input-group my-2">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon-date">Data de Corte</span>
                        </div>
                        <input type="date" required class="form-control" id="date" name="date" aria-describedby="basic-addon-date">
                    </div>                      
                </div>
                <div class="form-group col-md-3 col-sm-6">
                   <label class="sr-only" for="search">Buscar</label>
                   <button type="submit" class="btn btn-outline-success btn-block" id="search" name="search" value="1">Enviar</button>
                </div>
            </div>
        </form>
        <table id="table_id" class="display table table-bordered table-hover" role="table">
            <thead>
                <tr>
                    <th scope="col" class="text-center align-middle">N°</th>
                    <th scope="col" class="text-center align-middle">Idade</th>
                    <th scope="col" class="text-center align-middle">Nome</th>
                    <th scope="col" class="text-center align-middle">Mãe</th>
                    <th scope="col" class="text-center align-middle">Data de Nascimento</th>
                    <th scope="col" class="text-center align-middle">Situação</th>
                </tr>
            </thead>
            <tbody>
                <?php $i=0;  foreach ($rows as $row => $column): $i++;?>            
                    <tr class="custom-anchor" data-href="<?php echo $column['cid'] ?>" onclick="candidateData(this)" title="Editar Candidato">
                        <td scope="row" class="text-center"><?php echo $i ?></td>
                        <?php //isset($_GET['date'])?$date=$_GET['date']:$date=date("Y-m-d")?>
                            
                        <td scope="row" class="text-center"><?php echo dateDifference(date("Y-m-d"), $column['birth_date'],'%y') ?></td>
                        <td scope="row" class="text-center"><?php echo $column['cname'] ?></td>
                        <td scope="row" class="text-center"><?php echo $column['mother'] ?></td>
                        <td scope="row" class="text-center"><?php echo stringToDate($column['birth_date']) ?></td>
                        <td scope="row" class="text-center"><?php echo $controller->getSituation($column['situation']) ?></td>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    </section>
    <!-- EMPTY DIV - PUSH FOOTER -->
    <div class="container pb-5 mb-5">
    </div>
<?php
require_once 'template/footer.php';
require_once 'template/delete_candidate_modal.php';
?>
<script type="text/javascript">
    datatableApplyCandidates();
    $('#toolTip').tooltip();
</script>
<?php if (isset($_SESSION['data']))triggerModal() ?>