﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace Practice___MVC.Filters
{
    public class FilterProvider : IFilterProvider
    {
        private readonly IEnumerable<Func<ControllerContext, ActionDescriptor, object>> _conditions;
        public FilterProvider(IEnumerable<Func<ControllerContext, ActionDescriptor, object>> conditions)
        {
            _conditions = conditions;
        }

        public IEnumerable<Filter> GetFilters(ControllerContext controllerContext, ActionDescriptor actionDescriptor)
        {
            return from condition in _conditions
            select condition(controllerContext, actionDescriptor) into filter
            where filter != null
            select new Filter(filter, FilterScope.Global, null);
        }
    }
}