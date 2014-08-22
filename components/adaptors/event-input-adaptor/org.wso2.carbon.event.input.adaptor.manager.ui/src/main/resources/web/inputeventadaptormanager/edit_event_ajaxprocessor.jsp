<!--
~ Copyright (c) 2005-2014, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
~
~ WSO2 Inc. licenses this file to you under the Apache License,
~ Version 2.0 (the "License"); you may not use this file except
~ in compliance with the License.
~ You may obtain a copy of the License at
~
~    http://www.apache.org/licenses/LICENSE-2.0
~
~ Unless required by applicable law or agreed to in writing,
~ software distributed under the License is distributed on an
~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
~ KIND, either express or implied.  See the License for the
~ specific language governing permissions and limitations
~ under the License.
-->
<%@ page
        import="org.wso2.carbon.event.input.adaptor.manager.stub.InputEventAdaptorManagerAdminServiceStub" %>
<%@ page
        import="org.wso2.carbon.event.input.adaptor.manager.ui.InputEventAdaptorUIUtils" %>


<%
    // get required parameters to add a event adaptor to back end.
    InputEventAdaptorManagerAdminServiceStub stub = InputEventAdaptorUIUtils.getInputEventManagerAdminService(config, session, request);
    String eventName = request.getParameter("eventName");
    String eventPath = request.getParameter("eventPath");
    String eventAdaptorConfiguration = request.getParameter("eventConfiguration");
    String msg = null;
    if (eventName != null) {
        try {
            // add event adaptor via admin service
            stub.editActiveInputEventAdaptorConfiguration(eventAdaptorConfiguration, eventName);
            msg = "true";
        } catch (Exception e) {
            msg = e.getMessage();

        }
    } else if (eventPath != null) {
        try {
            // add event adaptor via admin service
            stub.editInactiveInputEventAdaptorConfiguration(eventAdaptorConfiguration, eventPath);
            msg = "true";
        } catch (Exception e) {
            msg = e.getMessage();

        }
    }

%>  <%=msg%>   <%

%>
