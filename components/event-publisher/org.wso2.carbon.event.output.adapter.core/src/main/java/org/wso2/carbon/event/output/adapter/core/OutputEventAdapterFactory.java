/*
 * Copyright (c) 2005 - 2014, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy
 * of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed
 * under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations under the License.
 */
package org.wso2.carbon.event.output.adapter.core;

import java.util.List;

public abstract class OutputEventAdapterFactory {

    private OutputEventAdapterSchema outputEventAdapterSchema;

    public abstract String getType();

    public abstract List<String> getSupportedMessageFormats();

    public abstract List<Property> getStaticPropertyList();

    public abstract List<Property> getDynamicPropertyList();

    public abstract OutputEventAdapter createEventAdapter(OutputEventAdapterConfiguration eventAdapterConfiguration);

    public OutputEventAdapterSchema getOutputEventAdapterSchema() {
        if (outputEventAdapterSchema == null) {
            outputEventAdapterSchema = new OutputEventAdapterSchema(getType(), getSupportedMessageFormats(), getStaticPropertyList(), getDynamicPropertyList());
        }
        return outputEventAdapterSchema;
    }

}
