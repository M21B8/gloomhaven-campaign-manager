from assertpy import assert_that
import os
import shutil
import ttsautoui as tts
import time
import unittest


class GloomhavenCampaignManagerTest(unittest.TestCase):

    LOAD_TIME = 25  # time to wait for loading to finish
    SAVE_TIME = 5   # time to wait for saving to finish

    def tearDown(self):
        tts.goto_main_menu()

    def test_all_of_it(self):
        savefile = "all_of_it"

        self.verify_load_and_save(savefile)

    def test_all_perks_1(self):
        savefile = "all_perks_1"

        self.verify_load_and_save(savefile)

    def test_all_perks_2(self):
        savefile = "all_perks_2"

        self.verify_load_and_save(savefile)

    def test_all_perks_3(self):
        savefile = "all_perks_3"

        self.verify_load_and_save(savefile)

    def test_all_perks_4(self):
        savefile = "all_perks_4"

        self.verify_load_and_save(savefile)

    def test_all_perks_5(self):
        savefile = "all_perks_5"

        self.verify_load_and_save(savefile)

    def test_complete(self):
        savefile = "complete"

        self.verify_load_and_save(savefile)

    def test_forgotten_circles(self):
        savefile = "forgotten_circles"

        self.verify_load_and_save(savefile)

    def test_typos(self):
        savefile = "typos"

        self.verify_load_and_save(savefile)

    def test_overlapped(self):
        savefile = "overlapped"

        self.verify_save(savefile)

    def load_file(self, filename):
        with open(f"input/{filename}.json", "r", encoding="utf-8") as file:
            return file.read()

    def verify_load_and_save(self, savefile):
        self.load_latest_mod()
        saved = self.load_and_save(savefile)

        self.assert_same_content(saved, f"{savefile}-expected")

    def verify_save(self, savefile):
        self.load_from_savegame(savefile)
        saved = self.save_savefile()

        self.assert_same_content(saved, f"{savefile}-expected")

    def load_latest_mod(self):
        tts.create_singleplayer()
        tts.load_workshop("gloomhaven", folders=["coop"])
        tts.load_saved_object("campaign_manager", folders=["gloomhaven"])

    def load_from_savegame(self, name):
        target_name = "TS_Save_1"
        save_path = os.path.expandvars("%userprofile%/documents/My Games/Tabletop Simulator/Saves")

        src = f"input/{name}.json"
        dest = f"{save_path}/Gloomhaven/Test/{target_name}.json"
        shutil.copy2(src, dest)

        src = "res/save/test_whole.png"
        dest = f"{save_path}/Gloomhaven/Test/{target_name}.png"
        shutil.copy2(src, dest)

        tts.create_singleplayer()
        tts.load_save("test", folders=["gloomhaven", "test"])
        tts.load_saved_object("campaign_manager", folders=["gloomhaven"])

    def load_and_save(self, savefile):
        savefile_content = self.load_file(savefile)
        self.load_savefile(savefile_content)
        return self.save_savefile()

    def load_savefile(self, savefile_content):
        tts.create_notebook("Savefile", savefile_content)
        tts.enter_chat("~load~")
        time.sleep(self.LOAD_TIME)

    def save_savefile(self):
        tts.enter_chat("~save~")
        time.sleep(self.SAVE_TIME)
        return tts.get_notebook("new_savefile")

    def assert_same_content(self, content, expected_file):
        expected_content = self.load_file(expected_file)
        assert_that(content).is_equal_to(expected_content)


if __name__ == '__main__':
    unittest.main()
