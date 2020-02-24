disp('***************START GA ALGORITHM*******************')
    %--------------------------Parameters----------------------------%
    tmp=size(All_energy);
    length=tmp(1);                  %Number of configurations
    %All_coordinate_1=zeros(n,3*length);
    %All_energy_1=zeros(length,1);
    p_inherit=0.35;                 %Probability of interchanging
    p_mutation=0.30;                %Probability of mutation
    p_remain=0.35;
    inherit_num=floor(length*p_inherit/2);  %number of pairs of parents
    mutation_num=2*inherit_num+floor(length*p_mutation);  %number of mutated samples
    remain_num=length-mutation_num-4;
    remain_previlige=length-4;   
                                            %number of remained samples
    %------------------Parameters Setting Finished-------------------%
for l=1:2:15
    for i=1:5000
    %-----------------------Roulette Setting-------------------------%
    roulette_list=zeros(length,1);
    roulette_list(1)=0;
    for j=2:length
        if(All_energy(j)>-0.5)
            roulette_list(j)=roulette_list(j-1);
        end
        roulette_list(j)=roulette_list(j-1)-All_energy(j);
    end
    roulette_total=roulette_list(length);
    %-------------------Roulette Setting Finished--------------------%
    %----------------------Part I:Inheriting-------------------------%
    for j=1:inherit_num
        %Choosing parents and interchange sections
        roulette_wheel=roulette_total*rand(1);
        parent_1_index=find(roulette_list<roulette_wheel,1,'last');
        roulette_wheel=roulette_total*rand(1);
        parent_2_index=find(roulette_list<roulette_wheel,1,'last');
        interchange_section_1=ceil(n*rand(1));
        interchange_section_2=ceil(n*rand(1));
        %interchaning genes and generate children
        All_coordinate_1(:,6*j-5:6*j-3)=All_coordinate(:,3*...
            parent_1_index-2:3*parent_1_index);
        All_coordinate_1(:,6*j-2:6*j)=All_coordinate(:,3*...
            parent_2_index-2:3*parent_2_index);
        tmp=All_coordinate_1(interchange_section_1:interchange_section_2...
            ,6*j-5:6*j-3);
        All_coordinate_1(interchange_section_1:interchange_section_2...
            ,6*j-5:6*j-3)=All_coordinate_1(interchange_section_1:...
            interchange_section_2,6*j-2:6*j);
        All_coordinate_1(interchange_section_1:interchange_section_2,...
            6*j-2:6*j)=tmp;
        
    end
    %------------------Part I:Inheriting Finished--------------------% 
    %-----------------------Part II:Mutation-------------------------%
    for j=2*inherit_num+1:mutation_num
    %Choosing parents and mutate sections
        roulette_wheel=roulette_total*rand(1);
        parent_1_index=find(roulette_list<roulette_wheel,1,'last');
    %mutate
        All_coordinate_1(:,3*j-2:3*j)=All_coordinate(:,3*...
            parent_1_index-2:3*parent_1_index);
        mutate_section_1=ceil(n*rand(1));
        preturb=(10/l)*randn(1,3);
        All_coordinate_1(mutate_section_1,3*j-2:3*j)=...
             All_coordinate_1(mutate_section_1,3*j-2:3*j)+preturb;
    end
    %------------------Part II:Mutation Finished---------------------%
    %---------------------Part III:Remaining-------------------------%
    for j=mutation_num+1:length-5
    %Choosing parents
        roulette_wheel=roulette_total*rand(1);
        parent_1_index=find(roulette_list<roulette_wheel,1,'last');
    %Remain
        All_coordinate_1(:,3*j-2:3*j)=All_coordinate(:,3*...
            parent_1_index-2:3*parent_1_index);
    end
    %-----------------Part III:Remaining Finished--------------------%
    %--------------------Part IV: Previlige--------------------------%
    [~,position]=sort(All_energy_1);
    for j=1:5
        All_coordinate_1(:,3*(length+1-j)-2:3*(length+1-j))=...
            All_coordinate(:,3*position(j)-2:3*position(j));
    end
    %-----------------Part IV: Previlige Finished--------------------%
    %------------------Update New Configurations---------------------%
    All_coordinate=All_coordinate_1;
    for j=1:length
        coordinate=All_coordinate_1(:,3*j-2:3*j);
        distance=Get_Distance(n,coordinate);
        All_energy_1(j)=Lennard_Jones_Potential( distance,sigma,epsilon,n );
    end
    All_coordinate=All_coordinate-repmat(mean(All_coordinate),n,1);
    %---------------Update New Configuration Finished----------------%
    if(mod(i,500)==0)
        [a,~]=min(All_energy_1);
        disp(a);
    end
    end
end
disp('***************STOP GA ALGORITHM*******************')
%-------------------------GA Algorithm Finished--------------------------%
%************************************************************************%
%--------------------Data Analysing And Visualization--------------------%
[a,b]=min(All_energy_1);
disp('Minimized Energy=');
disp(a);
coordinate=All_coordinate(:,b*3-2:b*3);
X=coordinate(:,1);
Y=coordinate(:,2);
Z=coordinate(:,3);
scatter3(X,Y,Z)