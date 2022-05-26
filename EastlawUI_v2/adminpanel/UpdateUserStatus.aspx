﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateUserStatus.aspx.cs" Inherits="EastlawUI_v2.adminpanel.UpdateUserStatus" 
    MasterPageFile="~/adminpanel/Site1.Master"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register src="usercontrol/usersearch_actionpanel.ascx" tagname="usersearch_actionpanel" tagprefix="uc1" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="cntplc">
        
  <%--  <asp:UpdatePanel ID="updPnl" runat="server">
        <ContentTemplate>--%>
             
      <section class="content-header">
                    <h1>
                        Users
                        <small>Update User Status</small>
                    </h1>
                </section>
      
            <section class="content">
                <uc1:usersearch_actionpanel ID="usersearch_actionpanel1" runat="server" />
                   <%--<table style="width:100%">
                    <tr>
                        <td>Email ID: </td>
                        <td> <asp:TextBox ID="txtSearchEmailID" runat="server" Width="220" class="form-control"> </asp:TextBox></td>
                         <td>Mobile Number: </td>
                        <td> <asp:TextBox ID="txSearchtMobileNo" runat="server" Width="220" class="form-control"> </asp:TextBox></td>
                        <td><asp:Button ID="btnSearch" runat="server" Text="Search" class="btn btn-block btn-primary"  Width="100" OnClick="btnSearch_Click" CausesValidation="false" />
                            <asp:Label ID="lblMsg" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                         <td> 
                            
                         </td>
                        <td> </td>
                        <td> &nbsp;</td>
                        <td >
                            
                            &nbsp;&nbsp; &nbsp;
                            
                            </td>
                    </tr>
                </table>--%>
                <div class="row">
                    <!-- left column -->
                    <!--/.col (left) -->
                    <!-- right column -->
                    <div class="col-md-6">
                        <!-- general form elements disabled -->
                        <div class="box box-warning">
                            <div class="box-header">
                                <h3 class="box-title">User Details</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <div class="form-group">
                                    <label>
                                        User Type: *
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                     ControlToValidate="ddlUserType" ErrorMessage="Required" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                    

                                    </label>
                                     <asp:DropDownList ID="ddlUserType" runat="server" class="form-control" AutoPostBack="True" Enabled="false" ></asp:DropDownList>
                                </div>
                                <div class="form-group" id="divCompany" runat="server" style="display:none">
                                    <label>
                                        Company Name: *
                                                 <asp:RequiredFieldValidator ID="rfvddlCompany" runat="server"
                                                     ControlToValidate="ddlCompany" ErrorMessage="Required" ForeColor="Red" InitialValue="0" Enabled="false"></asp:RequiredFieldValidator>

                                    </label>
                                   <asp:DropDownList ID="ddlCompany" runat="server" class="form-control" Enabled="false"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Organization Type: *
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                     ControlToValidate="ddlOrgType" ErrorMessage="Required" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                    </label>

                                    <asp:DropDownList ID="ddlOrgType" runat="server" class="form-control" Enabled="false"></asp:DropDownList>
                                </div>
                                
                                <div class="form-group">
                                    <label>
                                        Email ID <i> (This will be login name and should be unique)</i>: *
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                     ControlToValidate="txtEmailID" ErrorMessage="Required" ForeColor="Red"  ></asp:RequiredFieldValidator>
                                                
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email ID" ControlToValidate="txtEmailID" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ></asp:RegularExpressionValidator>
                                                
                                    </label>
                                    <asp:TextBox ID="txtEmailID" runat="server" class="form-control"> </asp:TextBox>
                                </div>
                                
                                <div class="form-group">
                                    <label>
                                       Full Name: *
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                                     ControlToValidate="txtFullName" ErrorMessage="Required" ForeColor="Red"  ></asp:RequiredFieldValidator>
                                                
                                    </label>
                                     <asp:TextBox ID="txtFullName" runat="server" class="form-control" Enabled="false" > </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                       Phone Number: *
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                                     ControlToValidate="txtPhone" ErrorMessage="Required" ForeColor="Red"  ></asp:RequiredFieldValidator>
                                                
                                    </label>
                                     <asp:TextBox ID="txtPhone" runat="server" class="form-control" Enabled="false"> </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Address: 
                                                
                                    </label>
                                    <asp:TextBox ID="txtAdd" runat="server" class="form-control" TextMode="MultiLine" Height="100" Enabled="false"> </asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>
                                        Country: *
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                     ControlToValidate="ddlCountry" ErrorMessage="Required" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                    </label>

                                    <asp:DropDownList ID="ddlCountry" runat="server" class="form-control" Enabled="false"></asp:DropDownList>
                                </div>

                                
                               
                                <div class="form-group">
                                    <label>
                                        Status: *
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                                     ControlToValidate="ddlStatus" ErrorMessage="Required" ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>

                                    </label>

                                    <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" >
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Approved" Value="Approved" ></asp:ListItem>
                                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                        <asp:ListItem Text="Expired" Value="Expired"></asp:ListItem>
                                        <asp:ListItem Text="Pending - Activation" Value="Pending - Activation"></asp:ListItem>
                                        <asp:ListItem Text="General Block" Value="General Block"></asp:ListItem>
                                        <asp:ListItem Text="Breach of privacy Block" Value="Breach of privacy Block"></asp:ListItem>
                                        <asp:ListItem Text="Non-Payment Block" Value="Non-Payment Block"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                 <div class="form-group">
                                    <label>
                                       No. Of days : 
                                                
                                    </label>
                                    <asp:TextBox ID="txtNoOfdays" runat="server" class="form-control" Enabled="false"> </asp:TextBox>
                                     <asp:Label ID="lblInvNo" runat="server" Text="0" Visible="false"></asp:Label>
                                    
                                </div>
                                
                               <%-- <div class="form-group">
                                    <label>
                                        Active:
                                           
                                    </label>
                                    <asp:CheckBox ID="chkActive" runat="server" class="form-control" Enabled="false"/>
                                </div>--%>
                               
                               


                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary" Width="150"  />
                                &nbsp;&nbsp;
               
            <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" Text="Save" Width="150" OnClick="btnSave_Click" />





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
            
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>