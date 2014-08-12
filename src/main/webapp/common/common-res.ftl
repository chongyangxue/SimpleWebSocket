({
	"result" : <#if (actionErrors?exists || fieldsErrors?exists)>"error"<#else>"success"</#if>,
	"context" :  {
		"messages" : {<#if messages?exists>
						<#list messages?keys as mKey>
							"${mKey?js_string}":"${messages[mKey]?js_string}"<#if mKey_has_next>,</#if></#list>
					 </#if>},
		"actionErrors" : <#if actionErrors?exists>								
									"${actionErrors?js_string}"
						 <#else>""
						 </#if>,
		"fieldsErrors" : [<#if fieldsErrors?exists>
							<#list fieldsErrors as error>
									"${error?js_string}"<#if error_has_next>,</#if>
							</#list>
						</#if>]  
	}
})