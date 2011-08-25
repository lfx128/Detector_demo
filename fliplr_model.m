function model = fliplr_model(model)

if isempty(model), return; end

gW = model.grid_width;

x = dec2bin(0:255,8);
x = [x(:,6) x(:,7) x(:,8) x(:,4) x(:,5) x(:,1) x(:,2) x(:,3)];
idxLR = bin2dec(x)+1;

for ii = 1:length(model.cascade)
    wc  = model.cascade{ii}.found_class;

    for i = 1:length(wc);
        switch wc{i}.feature.identif
            case 'lbp'
                wc{i}.bin_response = wc{i}.bin_response(idxLR);
                wc{i}.feature.bb = fliplr_bbox(wc{i}.feature.bb, gW);
                wc{i}.feature.round_col = double(~wc{i}.feature.round_col);

            case 'haar'
                wc{i}.feature = fliplr_haar(wc{i}.feature, gW);

            case 'lda'
                for ii = 1:length(wc{i}.feature.features)
                    wc{i}.feature.features{ii} = fliplr_haar(wc{i}.feature.features{ii}, gW);
                end
            case 'hog'
                wc{i}.feature.bb = fliplr_bbox(wc{i}.feature.bb, gW);
                w = wc{i}.feature.w;
                wc{i}.feature.w = [w(5) w(4) w(3) w(2) w(1) w(8) w(7) w(6)];
        end
    end

    model.cascade{ii}.found_class = wc;
end

function bbout = fliplr_bbox(bb, gW)

bbout = [gW - bb(3) + 1; bb(2); gW - bb(1) + 1;bb(4)];

function haar = fliplr_haar(haar, gW)

haar.bb = fliplr_bbox(haar.bb, gW);
haar.round_col = double(~haar.round_col);

if haar.signed
    if ismember(haar.type,[2 5]);
        haar.negative = double(~haar.negative);
    end
end

