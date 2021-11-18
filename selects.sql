select `key`, id_aluno from md03_dw.dimaluno limit 10000000;
select `key`, id_ano from md03_dw.dimano limit 10000000;
select `key`, cod_curso from md03_dw.dimcurso limit 10000000;
select `key`, id_aluno from md03_dw.dimdeficiencia limit 10000000;
select `key`, cod_ies from md03_dw.dimies limit 10000000;
select `key`, cod_municipio from md03_dw.dimmunicipio limit 10000000;
select `key`, cod_curso from md03_dw.dimrecursosacessibilidade limit 10000000;

delete from md03_dw.dimdeficiencia where id_aluno = 1;

INSERT INTO md03_dw.dimdeficiencia (`key`, id_aluno, deficiencia_auditiva, deficiencia_fisica, deficiencia_intelectual, deficiencia_multipla, deficiencia_surdez, deficiencia_surdocegueira, deficiencia_baixa_visao, deficiencia_cegueira, deficiencia_superdotacao, deficiencia_tgd_autismo, deficiencia_tgd_sindrome_asperger, deficiencia_tgd_sindrome_rett, deficiencia_tgd_transtor_desintegrativo) VALUES (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1);