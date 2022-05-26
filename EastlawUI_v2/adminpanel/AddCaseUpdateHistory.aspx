﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCaseUpdateHistory.aspx.cs" Inherits="EastlawUI_v2.adminpanel.AddCaseUpdateHistory" 
    MasterPageFile="~/adminpanel/Site1.Master"%>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="cntplc">
  <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"
type = "text/javascript"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
type = "text/javascript"></script> 
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
rel = "Stylesheet" type="text/css" /> 
<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=txtJudgeName.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("/Service.asmx/GetJudgesTitle") %>',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            minLength: 1
        });

    });

</script> 
    </head>
     <asp:UpdatePanel ID="updPnl" runat="server">
        <ContentTemplate>
             
      <section class="content-header">
                    <h1>
                        Manage Cases
                        <small>Update Case History</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Cases Update</li>
                    </ol>
                </section>
      
            <section class="content">
                <div class="row">
                    <!-- left column -->
                    <!--/.col (left) -->
                    <!-- right column -->
                    <div class="col-xs-12">
                        <!-- general form elements disabled -->
                        <div class="box box-warning">
                            <div class="box-header">
                                <h3 class="box-title">Citation Details</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                
                                <div class="form-group">
                                    <label>
                                        Year: *
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                                     ControlToValidate="ddlYear" ErrorMessage="Required" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                                    </label>
                                     <asp:DropDownList ID="ddlYear" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Citation : *
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                     ControlToValidate="txtCitation" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </label>
                                    <asp:TextBox ID="txtCitation" runat="server" class="form-control"> </asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>
                                        Auto Generated Citation/Local Referecne: 
                                    </label>

                                   
                                    <asp:TextBox ID="txtAutoGeneratedCitation" runat="server" class="form-control"> </asp:TextBox>
                                    
                                </div>
                                <div class="form-group">
                                    <label>
                                        Judge: *
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                     ControlToValidate="ddlJudge" ErrorMessage="Required" ForeColor="Red" InitialValue="0" Enabled="false"></asp:RequiredFieldValidator>
                                    </label>
                                     <asp:DropDownList ID="ddlJudge" runat="server" class="form-control" Visible="false"></asp:DropDownList>
                                    <asp:TextBox ID="txtJudgeName" runat="server" ass="form-control" ></asp:TextBox>
                                    <asp:Label ID="lblJudgeID" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="lblJudge" runat="server"></asp:Label>
                                </div>

                               
                                <div class="form-group">
                                    <label>
                                        Appeal : 
                                                
                                    </label>
                                    <asp:TextBox ID="txtAppeal" runat="server" class="form-control"> </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Appeallant: 
                                                
                                    </label>
                                    <asp:TextBox ID="txtAppeallant" runat="server" class="form-control"> </asp:TextBox>
                                </div>
                                 <div class="form-group">
                                    <label>
                                        Appeallant Type: 
                                                
                                    </label>
                                    <asp:TextBox ID="txtAppeallantType" runat="server" class="form-control"> </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Respondent: 
                                    </label>
                                    <asp:TextBox ID="txtRespondent" runat="server" class="form-control"> </asp:TextBox>
                                </div>
                                 <div class="form-group">
                                    <label>
                                       Judgment Date: 
                                                
                                    </label>
                                    <asp:TextBox ID="txtJDate" runat="server" class="form-control"> </asp:TextBox>
                                </div>
                                
                                <div class="form-group">
                                    <label>
                                       Hear Date: 
                                                
                                    </label>
                                    <asp:TextBox ID="txtHearDate" runat="server" class="form-control"> </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                       Head Notes:         
                                    </label>
                                    <%--<cc1:editor ID="editorHeadNotes" runat="server"  Height="500px" Width="100%" />--%>
                                    <telerik:RadEditor runat="server" ID="editorHeadNotes"  Width="100%" Height="750" >
    <ImageManager ViewPaths="/store/cases/imgs" UploadPaths="/store/cases/imgs" MaxUploadFileSize="1000000" />
    <DocumentManager ViewPaths="/store/cases/docs" UploadPaths="/store/cases/docs" MaxUploadFileSize="10000000" />
    <MediaManager ViewPaths="/store/cases/videos" UploadPaths="/store/cases/videos" MaxUploadFileSize="10000000"/>
</telerik:RadEditor>
                                </div>
                                <div class="form-group">
                                    <label>
                                      Judgment: 
                                    </label>
                                     
                                     
                                   <%-- <cc1:editor ID="editorJudgment" runat="server"  Height="300px" Width="100%" />--%>

                                    <%--<telerik:RadWindow ID="RadWindow1" runat="server" Width="805" Height="500" VisibleOnPageLoad="true">
<ContentTemplate>--%>
<telerik:RadEditor runat="server" ID="editorJudgment"  Width="100%" Height="750" >
    <ImageManager ViewPaths="/store/cases/imgs" UploadPaths="/store/cases/imgs" MaxUploadFileSize="1000000" />
    <DocumentManager ViewPaths="/store/cases/docs" UploadPaths="/store/cases/docs" MaxUploadFileSize="10000000" />
    <MediaManager ViewPaths="/store/cases/videos" UploadPaths="/store/cases/videos" MaxUploadFileSize="10000000"/>
</telerik:RadEditor>
                                   <%-- <cc1:editor ID="editorJudgment" runat="server"  Height="600px" Width="100%" />--%>
<%--</ContentTemplate>
</telerik:RadWindow>--%>

<%--<script type="text/javascript">
    var oldCommand = Telerik.Web.UI.RadEditor.prototype.toggleEnhancedEdit;

    Telerik.Web.UI.RadEditor.prototype.toggleEnhancedEdit = function (newValue) {
        if ($telerik.isSafari && typeof (newValue) != "undefined" && false == this.disableContentAreaStylesheet(newValue)) {
            window.setTimeout(Function.createDelegate(this, function () {
                this.disableContentAreaStylesheet(newValue);
            }), 200);
        } else {
            oldCommand.call(this, newValue);

        }
    };
</script>--%>
                                                
                                </div>
                                
                                <div class="form-group">
                                    <label>
                                      Keywords: 
                                                
                                    </label>
                                     <asp:TextBox ID="txtKeywords" runat="server" class="form-control" TextMode="MultiLine" Height="100"> </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                      Judgment Type: 
                                                
                                    </label>
                                     <asp:TextBox ID="txtJudgmentType" runat="server" class="form-control"> </asp:TextBox>
                                </div>
                                 <div class="form-group">
                                    <label>
                                      Result: 
                                                
                                    </label>
                                     <asp:TextBox ID="txtResult" runat="server" class="form-control"> </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                      Court: 
                                                
                                    </label>
                                     <asp:TextBox ID="txtCourt" runat="server" class="form-control"> </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                      Court City Name: 
                                                
                                    </label>
                                     <asp:TextBox ID="txtCourtCityName" runat="server" class="form-control"> </asp:TextBox>
                                    <asp:Label ID="lblFileName" runat="server" Visible="false"></asp:Label>
                                </div>
                                 <div class="form-group">
                                    <label>
                                      Page No: 
                                                
                                    </label>
                                     <asp:TextBox ID="txtPageNo" runat="server" class="form-control"> </asp:TextBox>
                                </div>

                               <%-- <div class="form-group">
                                    <label>
                                        Active:
                                           
                                    </label>
                                    <asp:CheckBox ID="chkActive" runat="server" class="form-control" />
                                </div>--%>




                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary" Width="150" OnClick="btnCancel_Click" />
                                &nbsp;&nbsp;
               <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" Width="150" OnClientClick = " return confirm('Are you sure you want to delete this record. ?');" OnClick="btnDelete_Click"/>
                                &nbsp;&nbsp;
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" Width="150" OnClick="btnSave_Click" />

                                 &nbsp;&nbsp;
               
            





                                <div class="alert alert-danger alert-dismissable" id="divError" runat="server" style="display: none">
                                    <button type="button" class="close" data-dismiss="alert">
                                        ×</button>
                                    <strong>Transaction failed ... </strong>
                                </div>
                                <div class="alert alert-info alert-dismissable" id="divSuccess" runat="server" style="display: none">
                                    <button type="button" class="close" data-dismiss="alert">
                                        ×</button>
                                    <strong>Transaction success !</strong>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                        <!-- /.box -->
                    </div>
                    <!--/.col (right) -->

                </div>
                

            </section>
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


