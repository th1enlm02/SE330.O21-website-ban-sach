import React from "react";

function Pagination() {
  return (
    <div className="mt-6">
      <div>
        <nav
          role="navigation"
          aria-label="Pagination Navigation"
          className="flex items-center justify-between"
        >
          <div className="flex justify-between flex-1 sm:hidden">
            <span>
              <button type="button" className="btn btn-default" disabled="">
                « Previous
              </button>
            </span>

            <span>
              <button className="btn btn-default">Next »</button>
            </span>
          </div>

          <div className="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
            <div>
              <p className="text-sm text-slate-700 leading-5 dark:text-slate-400">
                <span>Showing</span>
                <span className="font-medium">1</span>
                <span>to</span>
                <span className="font-medium">10</span>
                <span>of</span>
                <span className="font-medium">131</span>
                <span>results</span>
              </p>
            </div>

            <div>
              <span>
                <button type="button" className="btn btn-default" disabled="">
                  « Previous
                </button>
              </span>

              <span>
                <button type="button" className="ml-3 btn btn-default">
                  Next »
                </button>
              </span>
            </div>
          </div>
        </nav>
      </div>
    </div>
  );
}

export default Pagination;
