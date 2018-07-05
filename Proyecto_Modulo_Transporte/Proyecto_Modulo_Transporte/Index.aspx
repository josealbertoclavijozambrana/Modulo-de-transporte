<%@ Page Title="" Language="C#" MasterPageFile="~/pgprincipal.Master" AutoEventWireup="true" Theme="defecto" CodeBehind="Index.aspx.cs" Inherits="Proyecto_Modulo_Transporte.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />

    <div class="container">

        <div class="row">
            <div class="col-xs-3">
                <asp:Label runat="server">Latitud Origen</asp:Label>
                <br />
                <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:Label runat="server">Longitud Origen</asp:Label>
                <br />
                <asp:TextBox CssClass="form-control" runat="server"></asp:TextBox>
                <asp:Label runat="server">Peso</asp:Label>

                <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:Label runat="server">Volumen</asp:Label>
                <br />
                <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Label runat="server">Codigo Plan</asp:Label>
                <br />
                <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>

            </div>
            <div class="col-xs-3">
                <asp:Label runat="server">Latitud Destino</asp:Label>
                <br />
                <asp:TextBox runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:Label runat="server">Longitud Destino</asp:Label>
                <br />
                <asp:TextBox CssClass="form-control" runat="server"></asp:TextBox>
            
                <asp:Label runat="server">Tipo Operaciones</asp:Label>
                <asp:DropDownList CssClass="form-control" runat="server"></asp:DropDownList>
                <br />
                <asp:Label runat="server">Numero Operaciones</asp:Label>
                <br />
                <asp:DropDownList CssClass="form-control" runat="server"></asp:DropDownList>
                     <asp:Label runat="server">Registrar Cargamento</asp:Label>
                <br />
                <asp:Button Class=" btn btn-primary btn-block" runat="server"  Text="REGISTRAR CARGAMENTOS"></asp:Button>
            </div>
            <div class="col-xs-2">
                <asp:Label runat="server">Conductor</asp:Label>
                <br />
                <asp:DropDownList CssClass="form-control" runat="server"></asp:DropDownList>
                <br />
                <asp:Label runat="server">Ayudante</asp:Label>
                <br />
                <asp:DropDownList CssClass="form-control" runat="server"></asp:DropDownList>
                      <asp:Label runat="server">Vehiculo</asp:Label>
                <br />
                <asp:DropDownList CssClass="form-control" runat="server"></asp:DropDownList>
                   <br />
                <asp:Label runat="server">Total</asp:Label>
                <br />
                <asp:TextBox CssClass="form-control" runat="server"></asp:TextBox>

            </div>
        </div>






    </div>


</asp:Content>
