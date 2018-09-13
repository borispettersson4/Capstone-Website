<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="webpages_Store_Admin_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent1" Runat="Server">

        <asp:Panel ID="pnlOrders" runat="server">
    </asp:Panel>

            <table>
            <tr>
                <td>
                    <b>Total: </b>
                </td>
                <td>
                    <asp:Literal ID="litTotal" runat="server" Text=""></asp:Literal>
                </td>
            </tr>

            <tr>
                <td>
                    <b>Tax: </b>
                </td>
                <td>
                    <asp:Literal ID="litVat" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Shipping: </b>
                </td>
                <td>
                    $ 15
                </td>
            </tr>

            <tr>
                <td>
                    <b>Total Amount: </b>
                </td>
                <td>
                    <asp:Literal ID="litTotalAmount" runat="server" Text="" />
                </td>
            </tr>



        </table>

    <p>

    </p>

                <table>
            <tr>
                <td>
                    <b>Client Name : </b>
                </td>
                <td>
                    <asp:Literal ID="litClientName" runat="server" Text=""></asp:Literal>
                </td>
            </tr>

            <tr>
                <td>
                    <b>Client Email: </b>
                </td>
                <td>
                    <asp:Literal ID="litClientEmail" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Shipping Address: </b>
                </td>
                <td>
                   <asp:Literal ID="litClientAddress" runat="server" Text="" />
                </td>
            </tr>

            <tr>
                <td>
                    <b>Date Purchased: </b>
                </td>
                <td>
                    <asp:Literal ID="litPurchaseDate" runat="server" Text="" />
                </td>
            </tr>



        </table>

    </asp:Content>

