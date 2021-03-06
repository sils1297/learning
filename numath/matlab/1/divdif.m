function c = divdif(xdata, ydata)
    if length(xdata) ~= length(ydata)
        error('Length of input arguments must be equal.');
    end

    % Allocate space now for performance
    c = [ydata(1), zeros(1, length(xdata)-1)];
    if length(xdata) == 1
        return;
    end

    for j = 2:length(xdata)
        i = 1;
        ipo = divdif(xdata(i+1:j), ydata(i+1:j));
        imo = divdif(xdata(i:j-1), ydata(i:j-1));
        c(j) = (ipo(length(ipo)) -  imo(length(imo))) ...
              ./ (xdata(j) - xdata(i));
    end

    return;
end
