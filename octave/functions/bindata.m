%% usage: [binned_x, binned_y] = bindata (x, y, fun))
%%
%% Bins data in y based on unique x values, using the function pointed to
%% by function handle fun (defaults to @mean).
%% If y is omitted, it is assumed to be x(:,[2:end])
%%
%% Example:
%%   [newx, newy] = bindata(mydata);
%%   [newx, newy] = bindata(mydata_x, mydata_y);
%%   [newx, newy] = bindata(mydata_x, mydata_y, @max);
%%
%% Author: Geoff Holden <geoff@geoffholden.com>
function [binned_x, binned_y] = bindata (x, y = NaN, fun = @mean)
    if (nargin == 1)
        [binned_x, binned_y] = bindata(x(:,1),x(:,[2:end]), fun);
        return
    end
    if (nargin == 2 && strcmp(typeinfo(y), "function handle"))
        [binned_x, binned_y] = bindata(x(:,1),x(:,[2:end]), y);
        return
    end

    binned_x = unique(x);
    for index = [1:size(binned_x)(1)]
        binned_y(index, :) = fun(y(find(x == binned_x(index)),:));
    endfor
endfunction

