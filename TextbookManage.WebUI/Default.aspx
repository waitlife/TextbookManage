﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CPMis.WebPage.Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
    </head>
    <body>
        <form id="form1" runat="server">
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            </telerik:RadScriptManager>
            <telerik:RadSkinManager ID="RadSkinManager1" runat="server">
            </telerik:RadSkinManager>
            <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                <script language="javascript" type="text/javascript">
                    //如果点击的是导出按钮则将AJAX禁用
                    function onRequestStart(sender, args) {
                        if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                            args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                            args.get_eventTarget().indexOf("ExportToPdfButton") >= 0 ||
                            args.get_eventTarget().indexOf("ExportToCsvButton") >= 0) {

                            args.set_enableAjax(false);
                        }
                    }
                </script>
            </telerik:RadCodeBlock>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdatePanelsRenderMode="Inline">
                <ClientEvents OnRequestStart="onRequestStart" />
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="txt_OldPass" />
                            <telerik:AjaxUpdatedControl ControlID="txt_NewPass" />
                            <telerik:AjaxUpdatedControl ControlID="txt_CheckPass" />
                            <telerik:AjaxUpdatedControl ControlID="txt_OldName" />
                            <telerik:AjaxUpdatedControl ControlID="txt_NewName" />
                            <telerik:AjaxUpdatedControl ControlID="btn_Cancel" />
                            <telerik:AjaxUpdatedControl ControlID="btn_SavePass" />
                            <telerik:AjaxUpdatedControl ControlID="btn_SaveName" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btn_Cancel">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="txt_OldPass" />
                            <telerik:AjaxUpdatedControl ControlID="txt_NewPass" />
                            <telerik:AjaxUpdatedControl ControlID="txt_CheckPass" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadToolTipManager ID="RadToolTipManager1" runat="server" AutoTooltipify="true">
            </telerik:RadToolTipManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecoratedControls="All" />
            <div>
                <cp:CPMisTabStrip ID="tab_News" runat="server" MultiPageID="mtp_News">
                    <Tabs>
                        <cp:CPMisTab Text="个人信息(E)" AccessKey="E" />
                    </Tabs>
                </cp:CPMisTabStrip>
                <cp:CPMisMultiPage ID="mtp_News" runat="server">
                    <cp:CPMisPageView ID="upv_PersonelInfo" runat="server">
                        <div>
                            <asp:Panel ID="pnl_PassEdit" runat="server">
                                <center>
                                    <div style="padding-top: 20px; padding-bottom: 40px;">
                                        <fieldset style="width: 400px;">
                                            <legend>修改密码</legend>
                                            <center>
                                                <table style="width: 320px; text-align: left;">
                                                    <tr>
                                                        <td>
                                                            <cp:CPMisLabel ID="lbl_OldPass" runat="server" Text="原密码:"></cp:CPMisLabel>
                                                        </td>
                                                        <td>
                                                            <cp:CPMisTextBox ID="txt_OldPass" runat="server" SkinID="tb160" Width="200px" TextMode="Password">
                                                            </cp:CPMisTextBox>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <cp:CPMisLabel ID="lbl_NewPass" runat="server" Text="新密码:"></cp:CPMisLabel>
                                                        </td>
                                                        <td>
                                                            <cp:CPMisTextBox ID="txt_NewPass" runat="server" SkinID="tb160" Width="200px" TextMode="Password">
                                                            </cp:CPMisTextBox>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <cp:CPMisLabel ID="lbl_CheckPass" runat="server" Text="确定密码:"></cp:CPMisLabel>
                                                        </td>
                                                        <td>
                                                            <cp:CPMisTextBox ID="txt_CheckPass" runat="server" SkinID="tb160" Width="200px"
                                                                              TextMode="Password">
                                                            </cp:CPMisTextBox>
                                                        </td>
                                                        <td>
                                                            <asp:CompareValidator ID="cpv_True" runat="server" ErrorMessage="*两次输入的密码不一样!" ControlToCompare="txt_NewPass"
                                                                                  ControlToValidate="txt_CheckPass" SetFocusOnError="true" Display="Dynamic">
                                                            </asp:CompareValidator>
                                           
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" align="center">
                                                            <cp:CPMisButton ID="btn_SavePass" runat="server" Text="修 改" OnClick="btn_SavePass_Click" />
                                                            <asp:Label ID="id" runat="server" Text="" Width="30px"></asp:Label>
                                                            <cp:CPMisButton ID="btn_Cancel" runat="server" Text="取 消" CausesValidation="False"
                                                                             OnClick="btn_Cancel_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </center>
                                        </fieldset>
                                        <table>
                                        </table>
                                    </div>
                                </center>
                            </asp:Panel>
                        </div>
                        <div>
                            <asp:Panel ID="pnl_UserNameEdit" runat="server">
                                <center>
                                    <fieldset style="width: 400px;">
                                        <legend>用户名修改</legend>
                                        <center>
                                            <table style="width: 320px; text-align: left;">
                                                <tr>
                                                    <td>
                                                        <cp:CPMisLabel ID="lbl_OldName" runat="server" Text="现用户名:"></cp:CPMisLabel>
                                                    </td>
                                                    <td>
                                                        <cp:CPMisTextBox ID="txt_OldName" runat="server" SkinID="tb160" Width="200px">
                                                        </cp:CPMisTextBox>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <cp:CPMisLabel ID="lbl_NewName" runat="server" Text="新用户名:"></cp:CPMisLabel>
                                                    </td>
                                                    <td>
                                                        <cp:CPMisTextBox ID="txt_NewName" runat="server" SkinID="tb160">
                                                        </cp:CPMisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" align="center">
                                                        <cp:CPMisButton ID="btn_SaveName" runat="server" Text="修 改" CausesValidation="False"
                                                                         OnClick="btn_SaveName_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </center>
                                    </fieldset>
                                </center>
                            </asp:Panel>
                        </div>
                    </cp:CPMisPageView>
                </cp:CPMisMultiPage>
            </div>
        </form>
    </body>
</html>
