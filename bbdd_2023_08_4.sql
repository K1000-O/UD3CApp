PGDMP         
                {        	   soccerapp    15.3    15.3 %    G           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            H           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            I           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            J           1262    16398 	   soccerapp    DATABASE     |   CREATE DATABASE soccerapp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE soccerapp;
                postgres    false                        3079    16399    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                   false            K           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    2            �            1259    16437 
   player_val    SEQUENCE     s   CREATE SEQUENCE public.player_val
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.player_val;
       public          postgres    false            �            1259    16476    events    TABLE     �   CREATE TABLE public.events (
    id integer DEFAULT nextval('public.player_val'::regclass) NOT NULL,
    info text NOT NULL,
    start date NOT NULL,
    "end" date NOT NULL,
    coach integer NOT NULL
);
    DROP TABLE public.events;
       public         heap    postgres    false    216            �            1259    16436    id_val    SEQUENCE     o   CREATE SEQUENCE public.id_val
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.id_val;
       public          postgres    false            �            1259    16438    players    TABLE     H  CREATE TABLE public.players (
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    team character varying(255),
    id integer DEFAULT nextval('public.player_val'::regclass) NOT NULL,
    pos character varying(255),
    foot character varying(255),
    "position" character varying(255)
);
    DROP TABLE public.players;
       public         heap    postgres    false    216            �            1259    16444    players_id_seq    SEQUENCE     �   CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.players_id_seq;
       public          postgres    false    217            L           0    0    players_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;
          public          postgres    false    218            �            1259    16445    players_seq    SEQUENCE     u   CREATE SEQUENCE public.players_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.players_seq;
       public          postgres    false            �            1259    16446    teams    TABLE     [   CREATE TABLE public.teams (
    team character varying(255) NOT NULL,
    coach integer
);
    DROP TABLE public.teams;
       public         heap    postgres    false            �            1259    16449 	   teams_seq    SEQUENCE     s   CREATE SEQUENCE public.teams_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.teams_seq;
       public          postgres    false            �            1259    16450    test_seq    SEQUENCE     r   CREATE SEQUENCE public.test_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE public.test_seq;
       public          postgres    false            �            1259    16451    users    TABLE     %  CREATE TABLE public.users (
    name character varying(255) NOT NULL,
    id integer DEFAULT nextval('public.id_val'::regclass) NOT NULL,
    password text NOT NULL,
    email character varying(255) NOT NULL,
    lastdateuse timestamp without time zone,
    date_registration date NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    215            �            1259    16457 	   users_seq    SEQUENCE     s   CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.users_seq;
       public          postgres    false            D          0    16476    events 
   TABLE DATA           ?   COPY public.events (id, info, start, "end", coach) FROM stdin;
    public          postgres    false    225   H&       <          0    16438    players 
   TABLE DATA           Q   COPY public.players (name, surname, team, id, pos, foot, "position") FROM stdin;
    public          postgres    false    217   e&       ?          0    16446    teams 
   TABLE DATA           ,   COPY public.teams (team, coach) FROM stdin;
    public          postgres    false    220   �'       B          0    16451    users 
   TABLE DATA           Z   COPY public.users (name, id, password, email, lastdateuse, date_registration) FROM stdin;
    public          postgres    false    223   (       M           0    0    id_val    SEQUENCE SET     4   SELECT pg_catalog.setval('public.id_val', 4, true);
          public          postgres    false    215            N           0    0 
   player_val    SEQUENCE SET     9   SELECT pg_catalog.setval('public.player_val', 20, true);
          public          postgres    false    216            O           0    0    players_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.players_id_seq', 7, true);
          public          postgres    false    218            P           0    0    players_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.players_seq', 1, false);
          public          postgres    false    219            Q           0    0 	   teams_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.teams_seq', 1, false);
          public          postgres    false    221            R           0    0    test_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('public.test_seq', 1, false);
          public          postgres    false    222            S           0    0 	   users_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.users_seq', 1, false);
          public          postgres    false    224            �           2606    16483    events events_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    225            �           2606    16459    players players_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.players DROP CONSTRAINT players_pkey;
       public            postgres    false    217            �           2606    16461    teams teams_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team);
 :   ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_pkey;
       public            postgres    false    220            �           2606    16463    users unique_email 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email UNIQUE (email);
 <   ALTER TABLE ONLY public.users DROP CONSTRAINT unique_email;
       public            postgres    false    223            �           2606    16465    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    223            �           2606    16466    players Team    FK CONSTRAINT     �   ALTER TABLE ONLY public.players
    ADD CONSTRAINT "Team" FOREIGN KEY (team) REFERENCES public.teams(team) ON UPDATE CASCADE ON DELETE SET NULL;
 8   ALTER TABLE ONLY public.players DROP CONSTRAINT "Team";
       public          postgres    false    220    3234    217            �           2606    16484    events coach_event    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT coach_event FOREIGN KEY (coach) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT coach_event;
       public          postgres    false    225    3238    223            �           2606    16471    teams coah_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.teams
    ADD CONSTRAINT coah_fkey FOREIGN KEY (coach) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 9   ALTER TABLE ONLY public.teams DROP CONSTRAINT coah_fkey;
       public          postgres    false    220    223    3238            D      x������ � �      <   @  x���Kn�0���9AD��"h�C���Jl�xB]A�LB��Q]�\��Y�E���D����g�{V����$��I�H�!�`�pވm�F������x��F*n��V�Q��/
c+:V�K$ܗ%�$�������Ec�H��F��9}j],.���JX�A&��V'9!�+j$�f�٫�5V�(��*������F����?�hã$�o�N qsb.9��
x�9��❑s���sHRҘ��ˁ�\��;�z�lji�^r���m��t9��R�SG�OK�����zz{/�/��jI�gO�}���`$n�*�<����.      ?   =   x�svtqqUp�4���ss���s}\�<���?.'W?/G_�+4���ʘ+F��� �      B   �   x�mͻ�0 й|�CW���I ��ŷ!.�"����zctpp>�	TS�q�)~�<�<+�a��&qU�z��?N��=D��^dj|lTY�\7��&8&���.�s�K���>}�.�u~���@U����:�wO5�����u{(�5b@�+�� Xr��=1� 6r     