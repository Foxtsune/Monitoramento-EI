<?php 
require_once '../assets/helpers.php';
require_once '../controller/CandidateController.php';
require_once ($controller->importHeader($_SESSION['admin']));
?>

    <section class="container">
        <div class="container">
            <div class="row m-2 pt-2 border-gray-top">
                <div class="col-md-5 col-sm-12 align-self-md-center">
                    <p class="text-uppercase">Dados do Candidato</p>
                </div>
                <div class="col-md-6 col-sm-12 ml-5">  
                    <p><span class="font-weight-bold">Data do Cadastro: </span><?php echo stringToDate($candidate['inscription_date'])?></p> 
                    <p><span class="font-weight-bold">Nome: </span><?php echo $candidate['cname']?></p> 
                    <p><span class="font-weight-bold">Data de Nascimento: </span><?php echo stringToDate($candidate['birth_date'])?></p> 
                    <p><span class="font-weight-bold">Situação: </span><?php echo $controller->getSituation($candidate['situation'])?></p> 
                </div>
            </div>
            <div class="row m-2 pt-2 border-gray-top">
                <div class="col-md-5 col-sm-12 align-self-md-center">
                    <p class="text-uppercase">Responsável</p>
                </div>
                <div class="col-md-6 col-sm-12 ml-5">
                    <p><span class="font-weight-bold">Mãe: </span> <?php echo $candidate['mother'] ?></p> 
                    <p><span class="font-weight-bold">Pai: </span> <?php echo $candidate['father'] ?></p>     
                </div>
            </div>
            <div class="row m-2 pt-2 border-gray-top border-gray-bottom">
                <div class="col-md-5 col-sm-12 align-self-md-center">
                    <p class="text-uppercase">Endereço e Contato</p>
                </div>
                <div class="col-md-6 col-sm-12 ml-5">
                    <p><span class="font-weight-bold">Logradouro: </span> <?php echo $candidate['street'] ?></p> 
                    <p><span class="font-weight-bold">Número: </span> <?php echo $candidate['number'] ?></p> 
                    <p><span class="font-weight-bold">Bairro: </span> <?php echo $candidate['neighborhood'] ?></p> 
                    <p><span class="font-weight-bold">Telefone: </span> <?php echo formatTel($candidate['tel1']) ?></p> 
                    <p><span class="font-weight-bold">Telefone: </span> <?php echo empty(($candidate['tel2']))?"":formatTel($candidate['tel2']) ?></p>         
                </div>
            </div>
            <div class="row m-2 pt-2 border-gray-bottom">
                <div class="col-md-5 col-sm-12 align-self-md-center">
                    <p class="text-uppercase">Situação e Unidade Destino</p>
                </div>
                <div class="col-md-6 col-sm-12 ml-5">
                    <p><span id="toolTip" class="font-weight-bold" tabindex="0" data-toggle="tooltip" title="Data que o Candidato foi encaminhado para unidade destino" style="cursor: help;">Data de Confirmação:</span> <?php echo isset($candidate['conf_date'])?stringToDate($candidate['conf_date']):"" ?></p> 
                    <p><span class="font-weight-bold">Situação: </span> <?php echo $controller->getSituation($candidate['situation']) ?></p> 
                    <p><span class="font-weight-bold">Unidade: </span> <?php echo isset($candidate['uname'])?$candidate['uname']:"" ?></p> 
                </div>
            </div>
            <div class="row m-2 pt-2 border-gray-bottom">
                <div class="col-md-5 col-sm-12 align-self-md-center">
                    <p class="text-uppercase">Observações</p>
                </div>
                <div class="col-md-6 col-sm-12 ml-5">
                    <p> <?php echo isset($candidate['obs'])?$candidate['obs']:"Nenhuma Observação" ?></p> 
                </div>
            </div>
        </div>
        <?php if (isset($_SESSION['admin']) && $_SESSION['admin']==1): ?>
        <div class="row justify-content-center">
            <div class="col col-md-3 my-2">
                <a class="btn btn-outline-success btn-block" href="../view/edit_candidate.php?id=<?php echo $candidate['cid'] ?>" role="button">Editar</a>
            </div>
            <div class="col col-md-3 my-2">
                <!-- <a class="btn btn-outline-secondary btn-block" href="../view/candidates.php" role="button">Voltar</a> -->
                <a class="btn btn-outline-secondary btn-block" target="_blank" href="candidate_file.php?id=<?php echo $candidate['cid'] ?>" role="button">Gerar Ficha</a>
            </div>
            <div class="col col-md-3 my-2">
                <a id="btndelete" class="btn btn-outline-danger btn-block" href="../controller/CandidateController.php?id=<?php echo $candidate['cid'] ?>&delete=1"  data-href="../controller/CandidateController.php?id=<?php echo $candidate['cid'] ?>&delete=1" data-toggle="modal" data-target="#confirm-delete" onclick="modalHref(this)" role="button">Apagar</a>
            </div>
        </div>
        <?php endif ?>
    </section>
    <!-- EMPTY DIV - PUSH FOOTER -->
    <div class="container pb-5 mb-5">
    </div>

<?php
require_once 'template/footer.php';
require_once 'template/delete_candidate_modal.php';
?>
<script type="text/javascript">
    $('#toolTip').tooltip();
</script>
<?php if (isset($_SESSION['data']))triggerModal() ?>