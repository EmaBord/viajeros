<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:baseAdmin>
	<jsp:attribute name="eventos">
		class="active"
	</jsp:attribute>
<jsp:body>	
    
    
    

    
<section class="content-header">
   <h1>Mensajería<small>2 nuevos mensajes</small></h1>
   <ol class="breadcrumb">
     <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
     <li class="active">Mensajería</li>
   </ol>
</section>
											
<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-md-3">
      <a href="compose.html" class="btn btn-primary btn-block margin-bottom">Redactar</a>
      <div class="box box-solid">
        <div class="box-header with-border">
          <h3 class="box-title">Carpetas</h3>
          <div class="box-tools">
            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          </div>
        </div>
        <div class="box-body no-padding">
          <ul class="nav nav-pills nav-stacked">
            <li class="active"><a href="#"><i class="fa fa-inbox"></i> Bandeja de Entrada <span class="label label-primary pull-right">2</span></a></li>
            <li><a href="#"><i class="fa fa-envelope-o"></i> Enviados</a></li>
            <li><a href="#"><i class="fa fa-trash-o"></i> Papelera</a></li>
          </ul>
        </div><!-- /.box-body -->
      </div><!-- /. box -->
      
    </div><!-- /.col -->
    <div class="col-md-9">
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Bandeja de Entrada</h3>
          <div class="box-tools pull-right">
            <div class="has-feedback">
              <input type="text" class="form-control input-sm" placeholder="Buscar Correo">
              <span class="glyphicon glyphicon-search form-control-feedback"></span>
            </div>
          </div><!-- /.box-tools -->
        </div><!-- /.box-header -->
        <div class="box-body no-padding">
          <div class="mailbox-controls">
            <!-- Check all button -->
            <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>
            <div class="btn-group">
              <button class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
              <button class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
              <button class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
            </div><!-- /.btn-group -->
            <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
            <div class="pull-right">
              1-50/200
              <div class="btn-group">
                <button class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                <button class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
              </div><!-- /.btn-group -->
            </div><!-- /.pull-right -->
          </div>
          <div class="table-responsive mailbox-messages">
            <table class="table table-hover table-striped">
              <tbody>
                <tr>
                  <td><input type="checkbox"></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">Alexander Pierce</a></td>
                  <td class="mailbox-subject"><b>AdminLTE 2.0 Issue</b> - Trying to find a solution to this problem...</td>
                  <td class="mailbox-attachment"></td>
                  <td class="mailbox-date">5 mins ago</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td class="mailbox-star"><a href="#"><i class="fa fa-star-o text-yellow"></i></a></td>
                  <td class="mailbox-name"><a href="read-mail.html">Alexander Pierce</a></td>
                  <td class="mailbox-subject"><b>AdminLTE 2.0 Issue</b> - Trying to find a solution to this problem...</td>
                  <td class="mailbox-attachment"><i class="fa fa-paperclip"></i></td>
                  <td class="mailbox-date">28 mins ago</td>
                </tr>
                
              </tbody>
            </table><!-- /.table -->
          </div><!-- /.mail-box-messages -->
        </div><!-- /.box-body -->
        <div class="box-footer no-padding">
          <div class="mailbox-controls">
            <!-- Check all button -->
            <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>
            <div class="btn-group">
              <button class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
              <button class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
              <button class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
            </div><!-- /.btn-group -->
            <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
            <div class="pull-right">
              1-50/200
              <div class="btn-group">
                <button class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                <button class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
              </div><!-- /.btn-group -->
            </div><!-- /.pull-right -->
          </div>
        </div>
      </div><!-- /. box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->				        
											        
											       
											       
</jsp:body>
</t:baseAdmin>	