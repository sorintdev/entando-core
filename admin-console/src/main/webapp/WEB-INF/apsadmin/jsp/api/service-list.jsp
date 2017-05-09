<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>

<ol class="breadcrumb page-tabs-header breadcrumb-position">
    <li>Integrations</li>
    <li><s:text name="title.apiManagement" /></li>
    <li class="page-title-container"><s:text name="title.apiServiceManagement" /></li>
</ol>

<h1 class="page-title-container"><s:text name="title.apiServiceManagement" />
    <span class="pull-right">
        <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-html="true" title="" data-content="TO be inserted" data-placement="left" data-original-title=""><i class="fa fa-question-circle-o" aria-hidden="true"></i></a>
    </span>
</h1>

<div class="text-right">
    <div class="form-group-separator">
    </div>
</div>
<br>

<div id="main" role="main">
    <s:if test="hasActionErrors()">
        <div class="alert alert-danger alert-dismissable fade in">
            <button class="close" data-dismiss="alert"><span class="icon fa fa-times"></span></button>
            <h2 class="h4 margin-none"><s:text name="message.title.ActionErrors" /></h2>
            <ul class="margin-base-top">
                <s:iterator value="actionErrors">
                    <li><s:property escapeHtml="false" /></li>
                    </s:iterator>
            </ul>
        </div>
    </s:if>
    <s:if test="hasFieldErrors()">
        <div class="alert alert-danger alert-dismissable fade in">
            <button class="close" data-dismiss="alert"><span class="icon fa fa-times"></span></button>
            <h2 class="h4 margin-none"><s:text name="message.title.FieldErrors" /></h2>
            <ul class="margin-base-top">
                <s:iterator value="fieldErrors">
                    <s:iterator value="value">
                        <li><s:property escapeHtml="false" /></li>
                        </s:iterator>
                    </s:iterator>
            </ul>
        </div>
    </s:if>
    <s:if test="hasActionMessages()">
        <div class="alert alert-info alert-dismissable fade in">
            <button class="close" data-dismiss="alert"><span class="icon fa fa-times"></span></button>
            <h2 class="h4 margin-none"><s:text name="messages.confirm" /></h2>
            <ul class="margin-base-top">
                <s:iterator value="actionMessages">
                    <li><s:property escapeHtml="false" /></li>
                    </s:iterator>
            </ul>
        </div>
    </s:if>
    <s:set var="resourceFlavoursVar" value="resourceFlavours" />
    <s:set var="serviceFlavoursVar" value="serviceFlavours" />

    <s:form action="newService" cssClass="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-2" for="service-list">
                <s:text name="label.api.service.createNew" />
            </label>
            <div class="col-sm-10">
                <div class="input-group">
                    <select id="service-list" name="resourceCode" class="form-control">
                        <option value=""><s:text name="%{getText('note.choose')}" /></option>
                        <s:iterator value="#resourceFlavoursVar" var="resourceFlavourGroup">
                            <optgroup label="<s:property value="%{getText(#resourceFlavourGroup.get(0).getSectionCode()+'.name')}" escapeHtml="false" />">
                                <s:iterator value="#resourceFlavourGroup" var="resource">
                                    <option value="<s:property value="#resource.code" />">
                                        <s:property value="#resource.code" /> - <s:property value="#resource.description" />
                                    </option>
                                </s:iterator>
                            </optgroup>
                        </s:iterator>
                    </select>
                    <span class="input-group-btn">
                        <wpsf:submit type="button" cssClass="btn btn-default" action="newService">
                            <s:text name="label.add" /></wpsf:submit>
                        </span>
                    </div>
                </div>
            </div>
    </s:form>
    <s:if test="#serviceFlavoursVar.size()>0">
        <s:iterator var="resourceFlavour" value="#resourceFlavoursVar" status="varStatus">
            <s:set var="serviceGroupVar" value="#resourceFlavour.get(0).getSectionCode()" />
            <s:set var="servicesByGroupVar" value="#serviceFlavoursVar[#serviceGroupVar]" />
            <s:if test="null != #servicesByGroupVar && #servicesByGroupVar.size() > 0">
                <p class="sr-only">
                    <wpsf:hidden name="serviceGroup" value="%{#serviceGroupVar}" />
                </p>
                <div class="panel panel-default" id="<s:property value="#serviceGroupVar" />">
                    <div class="panel-heading"><s:text name="%{#serviceGroupVar}.name" /></div>
                    <table class="table table-striped table-bordered table-hover no-mb">
                        <tr>
                            <th><s:text name="name.api.service" /></th>
                            <th><s:text name="label.description" /></th>
                            <th class="text-center"><abbr title="<s:text name="label.active" />">A</abbr></th>
                            <th class="text-center"><abbr title="<s:text name="label.public" />">P</abbr></th>
                            <th class="text-center col-sm-1"><s:text name="label.remove" /></th>
                        </tr>
                        <s:iterator value="#servicesByGroupVar" var="service">
                            <tr>
                                <td>
                                    <wpsf:hidden name="%{#service.key + '_checkField'}" value="true" />
                                    <a title="<s:text name="label.edit" />: <s:property value="#service.key" />" href="<s:url action="edit"><s:param name="serviceKey"><s:property value="#service.key" /></s:param></s:url>">
                                                <span class="icon fa fa-cog"></span>
                                        <s:property value="#service.key" /></a>
                                </td>
                                <td>
                                    <s:property value="#service.value" />
                                </td>
                                <td class="text-center">
                                    <s:if test="#service.activeItem">
                                        <span title="<s:text name="label.active" />" class="icon fa fa-check"></span>
                                        <span class="sr-only"><s:text name="label.active" /></span>
                                    </s:if>
                                    <s:else>
                                        <span title="<s:text name="label.api.notactive" />" class="icon fa fa-minus text-muted"></span>
                                        <span class="sr-only"><s:text name="label.api.notactive" /></span>
                                    </s:else>
                                </td>
                                <td class="text-center">
                                    <s:if test="#service.publicItem">
                                        <span title="<s:text name="label.public" />" class="icon fa fa-check"></span>
                                        <span class="sr-only"><s:text name="label.public" /></span>
                                    </s:if>
                                    <s:else>
                                        <span title="<s:text name="label.api.notpublic" />" class="icon fa fa-minus text-muted"></span>
                                        <span class="sr-only"><s:text name="label.api.notpublic" /></span>
                                    </s:else>
                                </td>
                                <td class="text-center">
                                    <a
                                        href="<s:url action="trash"><s:param name="serviceKey"><s:property value="#service.key" /></s:param></s:url>"
                                        title="<s:text name="label.remove" />: <s:property value="#service.key" />">
                                        <span class="fa fa-trash-o fa-lg"></span>
                                    </a>
                                </td>
                            </tr>
                        </s:iterator>
                    </table>
                </div>
            </s:if>
        </s:iterator>
    </s:if>
    <s:else>
        <div class="alert alert-info" style="margin-left: 20px; margin-right: 20px">
            <span class="pficon pficon-info"></span>
            <strong><s:text name="note.api.noServices" /></strong>
        </div>
    </s:else>
</div>