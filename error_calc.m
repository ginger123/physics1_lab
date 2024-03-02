classdef error_calc
    properties
        meas {mustBeNumeric}
        err {mustBeNumeric}
    end
    methods(Static)
        function obj = accu(meas_init)
            obj.meas = meas_init;
            obj.err = 0;
        end
    end
    methods
        function obj = error_calc(meas_init, err_init)
            obj.meas = meas_init;
            obj.err = err_init;
        end

        function ret = plus(obj, val)
            new_meas = obj.meas + val.meas;
            new_err = sqrt(obj.err^2 + val.err^2);
            ret = error_calc(new_meas, new_err);
        end

        function ret = minus(obj, val)
            new_meas = obj.meas - val.meas;
            new_err = sqrt(obj.err^2 + val.err^2);
            ret = error_calc(new_meas, new_err);
        end

        function ret = times(obj, val)
            new_meas = obj.meas * val.meas;
            new_err = sqrt(((obj.err/obj.meas))^2 + (val.err/val.meas)^2) * new_meas;
            ret = error_calc(new_meas, new_err);
        end

        % consider de-duplicating with times
        function ret = mtimes(obj, val)
            new_meas = obj.meas * val.meas;
            new_err = sqrt(((obj.err/obj.meas))^2 + (val.err/val.meas)^2) * new_meas;
            ret = error_calc(new_meas, new_err);
        end

        function ret = mrdivide(obj, val)
            new_meas = obj.meas / val.meas;
            new_err = sqrt(((obj.err/obj.meas))^2 + (val.err/val.meas)^2) * new_meas;
            ret = error_calc(new_meas, new_err);
        end
        function ret = uminus(obj)
            ret = error_calc(-obj.meas, obj.err);
        end
        function ret = sqrt(obj)
            new_meas = sqrt(obj.meas);
            new_err = (1/2) * (obj.err/obj.meas) * new_meas;
            ret = error_calc(new_meas, new_err);
        end
        function ret = sp(obj)
            ret = sprintf("%f \\pm %f", obj.meas, obj.err);
        end
        function ret = rel(obj)
            ret = obj.err / obj.meas;
        end
    end
end
